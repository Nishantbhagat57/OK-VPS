import sqlite3
import sys
import os
from bs4 import BeautifulSoup
from urllib.parse import urlparse
from datetime import datetime
import random
import string
from fake_useragent import UserAgent
from concurrent.futures import ThreadPoolExecutor
import argparse
import requests
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry
from requests.packages.urllib3.exceptions import InsecureRequestWarning
import queue

# Initialize user agent
user_agent = UserAgent()

requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

retry_strategy = Retry(
    total=3,
    backoff_factor=1,
    status_forcelist=[429, 503, 504],
    allowed_methods=["HEAD", "GET", "OPTIONS"]
)
adapter = HTTPAdapter(max_retries=retry_strategy)

# Initialize it outside your get_response function
user_agent = UserAgent(browsers=['firefox', 'chrome'])

def get_response(url):
    for _ in range(3):  # retry 3 times
        try:
            with requests.Session() as session:  # use session as a context manager
                session.verify = False
                session.mount("https://", adapter) 
                session.mount("http://", adapter)

                headers = {"User-Agent": user_agent.random}
                response = session.get(url, headers=headers, timeout=15, allow_redirects=True)

                # only retry for error status codes 429, 503 and 504
                if response.status_code in [429, 503, 504]:
                    print(f"Attempt failed with status code {response.status_code}. Retrying URL: {url}")
                    continue

                soup = BeautifulSoup(response.text, 'html.parser')
                content = soup.prettify()
                content_length = len(content)
                return response.status_code, content_length, content

        except requests.exceptions.RequestException as ex:  # catch only RequestException errors
            print(f"Failed fetching URL: {url}. Error: {str(ex)}")
    # return none if 429, 503 or 504 after 3 retries
    return None, None, None

def create_database(db_path):
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE url_info (
            domain TEXT,
            url TEXT PRIMARY KEY,
            status INTEGER,
            content_length INTEGER,
            content TEXT
        )
    ''')
    conn.commit()
    return conn

def process_url(results_queue, url):
    url = url.strip()
    print(f"Processing URL: {url}")
    domain = urlparse(url).hostname
    status_code, content_length, content = get_response(url)
    if status_code is None:
        print(f"Skipping URL: {url} due to error during fetching.")
        return

    results_queue.put((domain, url, status_code, content_length, content))

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("input_file", help="Path to input file")
    parser.add_argument("output_dir", help="Path to output directory")
    parser.add_argument("-t", "--threads", type=int, default=20, help="Number of concurrent threads")

    args = parser.parse_args()

    with open(args.input_file) as f:
        urls = f.read().splitlines()
        print(f"Found {len(urls)} URLs. Starting process...")

    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    rand_str = ''.join(random.choices(string.ascii_lowercase + string.digits, k=5))
    db_name = f"{args.output_dir}/database_{rand_str}_{timestamp}.db"

    db = create_database(db_name)

    results_queue = queue.Queue()

    with ThreadPoolExecutor(max_workers=args.threads) as executor:
        for url in urls:
            executor.submit(process_url, results_queue, url)

        executor.shutdown(wait=True)

    while not results_queue.empty():
        domain, url, status_code, content_length, content = results_queue.get()
        db.cursor().execute(
            'INSERT INTO url_info (domain, url, status, content_length, content) VALUES(?,?,?,?,?)',
            (domain, url, status_code, content_length, content)
        )
        db.commit()

    db.close()
