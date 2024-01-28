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

# Initialize it outside your get_response function
user_agent = UserAgent(browsers=['firefox', 'chrome'])

def get_response(url):
    try:
        headers = {"User-Agent": user_agent.random}
        response = requests.get(url, headers=headers, timeout=15)
        soup = BeautifulSoup(response.text, 'html.parser')
        content = soup.prettify()
        content_length = len(content)
        status_code = response.status_code
        return status_code, content_length, content
    except Exception as ex:
        print(f"Exception with URL: {url} - {str(ex)}")
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

def process_urls(file_path, output_dir):
    with open(file_path) as f:
        urls = f.read().splitlines()

    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    rand_str = ''.join(random.choices(string.ascii_lowercase + string.digits, k=5))
    db_name = f"{output_dir}/database_{rand_str}_{timestamp}.db"

    db = create_database(db_name)

    for url in urls:
        url = url.strip()
        domain = urlparse(url).hostname
        status_code, content_length, content = get_response(url)
        if status_code is None:
            continue

        db.cursor().execute(
            'INSERT INTO url_info (domain, url, status, content_length, content) VALUES(?,?,?,?,?)',
            (domain, url, status_code, content_length, content)
        )
        db.commit()

    db.close()

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print(f"Usage: python {sys.argv[0]} [input file path] [output directory path]")
        sys.exit(1)

    process_urls(sys.argv[1], sys.argv[2])
