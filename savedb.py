import sqlite3
import sys
import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse
from datetime import datetime
import random
import string
from fake_useragent import UserAgent
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry
from concurrent.futures import ThreadPoolExecutor, as_completed
import queue

def get_domain(url):
    return urlparse(url).hostname

def create_database(db_path):
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    cursor.execute('''CREATE TABLE url_info
           (domain TEXT,
            url TEXT PRIMARY KEY,
            status INTEGER,
            content_length INTEGER,
            content TEXT)''')

    conn.commit()
    return conn

def get_response(session, url):
    try:
        headers = {"User-Agent": UserAgent(browsers=['firefox', 'chrome']).random}

        response = session.get(url, headers=headers, timeout=15)
        soup = BeautifulSoup(response.text, 'html.parser')
        content = soup.prettify()
        content_length = len(content)
        status_code = response.status_code

        return status_code, content_length, content
    except requests.exceptions.RequestException as e:
        print(f"Failed fetching URL: {url}. Error: {str(e)}")
        return None, None, None

def process_url(results_queue, session, url):
    url = url.strip()
    print(f"Processing URL: {url}")
    domain = get_domain(url)
    status_code, content_length, content = get_response(session, url)
    if status_code is None:
        print(f"Skipping URL: {url} due to error during fetching.")
        return
    results_queue.put((domain, url, status_code, content_length, content))

def process_urls(file_path, output_dir, max_threads, max_timeout):
    retry_strategy = Retry(total=3, backoff_factor=1, status_forcelist=[429, 503, 504])
    adapter = HTTPAdapter(max_retries=retry_strategy)
    
    with requests.Session() as session:
        session.mount("https://", adapter)
        session.mount("http://", adapter)

        with open(file_path) as f:
            urls = f.read().splitlines()

        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        rand_str = ''.join(random.choices(string.ascii_lowercase + string.digits, k=5))
        db_name = f"{output_dir}/database_{rand_str}_{timestamp}.db"

        db = create_database(db_name)

        results_queue = queue.Queue()

        with ThreadPoolExecutor(max_workers=max_threads) as executor:
            futures = [executor.submit(process_url, results_queue, session, url) for url in urls]

            for _ in as_completed(futures, timeout=max_timeout):
                while not results_queue.empty():
                    domain, url, status_code, content_length, content = results_queue.get()
                    db.cursor().execute(
                        'INSERT INTO url_info (domain, url, status, content_length, content) VALUES(?,?,?,?,?)',
                        (domain, url, status_code, content_length, content)
                    )
                    db.commit()

    print("All URLs processed.")
    db.close()
    print("Database closed.")
    

if __name__ == '__main__':
    if len(sys.argv) < 5:
        print(f"Usage: python {sys.argv[0]} [input file path] [output directory path] [max threads] [max timeout]")
        sys.exit(1)

    file_path = sys.argv[1]
    output_dir = sys.argv[2]
    max_threads = int(sys.argv[3])
    max_timeout = int(sys.argv[4])

    process_urls(file_path, output_dir, max_threads, max_timeout)
    sys.exit(1)
