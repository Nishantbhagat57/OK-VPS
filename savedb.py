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
import concurrent.futures
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
        response = session.get(url, headers=headers, timeout=15) # 15-second timeout
        soup = BeautifulSoup(response.text, 'html.parser')
        content = soup.prettify()
        content_length = len(content)
        status_code = response.status_code
        return status_code, content_length, content
    except requests.exceptions.RequestException as e:  # requests.get() errors
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


def process_urls(file_path, output_dir, max_threads):
    with open(file_path) as f:
        urls = f.read().splitlines()

    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    rand_str = ''.join(random.choices(string.ascii_lowercase + string.digits, k=5))
    db_name = f"{output_dir}/database_{rand_str}_{timestamp}.db"

    db = create_database(db_name)

    results_queue = queue.Queue()

    with requests.Session() as session, concurrent.futures.ThreadPoolExecutor(max_workers=max_threads) as executor:
        futures_to_urls = {executor.submit(process_url, results_queue, session, url): url for url in urls}
        for future in concurrent.futures.as_completed(futures_to_urls):
            url = futures_to_urls[future]
            try:
                future.result()  # check if the future completed successfully
            except Exception as exc:  # this will catch exceptions and errors when calling result()
                print(f"URL {url} generated an exception: {exc}")

    while not results_queue.empty():
        domain, url, status_code, content_length, content = results_queue.get()
        db.cursor().execute(
            'INSERT INTO url_info (domain, url, status, content_length, content) VALUES(?,?,?,?,?)',
            (domain, url, status_code, content_length, content)
        )
        db.commit()

    db.close()

if __name__ == "__main__":
    if len(sys.argv) < 4:
        print(f"Usage: python {sys.argv[0]} [input file path] [output directory path] [max threads]")
        sys.exit(1)

    input_file_path = sys.argv[1]
    output_dir = sys.argv[2]
    max_threads = int(sys.argv[3])

    process_urls(input_file_path, output_dir, max_threads)
    sys.exit()
