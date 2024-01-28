import sqlite3
import sys
import os
import time
import asyncio
import aiohttp
import ssl
import random
import string
from urllib.parse import urlparse
from fake_useragent import UserAgent

# db setup
rand_str = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
DB_NAME = f'database_{rand_str}_{int(time.time())}.sqlite'  # change as needed
conn = sqlite3.connect(DB_NAME)
db = conn.cursor()

# Table creation
sql = '''CREATE TABLE url_info (
    domain text, url text, status integer, content_length integer, content text)'''
db.execute(sql)
conn.commit()


async def fetch(url, session):
    try:
        # Forcibly skip SSL verification
        async with session.get(url, timeout=30, ssl=False) as response:
            content = await response.text()
            status = response.status
            content_length = len(content)
            domain = urlparse(url).netloc
            values = (domain, url, status, content_length, content)
            db.execute('''INSERT INTO url_info(domain, url, status, content_length, content)
            VALUES(?,?,?,?,?)''', values)
            conn.commit()
            print(f'Fetched: {url}')
    except Exception as e:
        print(f'Error in fetching: {url}')
        print(e)


async def process_URLs(urls):
    connector = aiohttp.TCPConnector(limit=20)
    headers = {"User-Agent": UserAgent(browsers=['firefox', 'chrome']).random}
    async with aiohttp.ClientSession(connector=connector, headers=headers) as session:
        tasks = []
        for url in urls:
            tasks.append(fetch(url, session))
        await asyncio.gather(*tasks)


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: python savedb.py /path/to/inputurls.txt /path/to/outputdirectory')
        sys.exit(1)

    input_filename = sys.argv[1]
    output_directory = sys.argv[2]

    if not os.path.isfile(input_filename):
        print(f'Error: File {input_filename} does not exist.')
        sys.exit(1)

    if not os.path.isdir(output_directory):
        print(f'Error: Directory {output_directory} does not exist.')
        sys.exit(1)
        
    with open(input_filename, 'r') as f:
        urls_to_fetch = f.read().splitlines()

    asyncio.run(process_URLs(urls_to_fetch))

    # move the DB to the output directory
    os.rename(DB_NAME, f'{output_directory}/{DB_NAME}')
