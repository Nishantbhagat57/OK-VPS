import asyncio
import os
import random
import sqlite3
import string
import sys
import time
from urllib.parse import urlparse

from playwright.async_api import async_playwright
from playwright_stealth import stealth_async

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

queue = asyncio.Queue()


async def fetch(browser, url):
    try:
        context = await browser.new_context()
        # Apply stealth plugin
        await stealth_async(context)
        page = await context.new_page()
        response = await page.goto(url, wait_until="networkidle", timeout=30000)
        content = await page.content()
        await context.close()

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


async def worker(browser):
    while True:
        url = await queue.get()
        await fetch(browser, url)
        queue.task_done()


async def main():
    # Check CLI arguments
    if len(sys.argv) != 3:
        print('Usage: python url_analysis_part1.py /path/to/inputurls.txt /path/to/outputdirectory')
        sys.exit(1)

    input_filename = sys.argv[1]
    output_directory = sys.argv[2]

    # Validate the input file and output directory
    if not os.path.isfile(input_filename):
        print(f'Error: File {input_filename} does not exist.')
        sys.exit(1)

    if not os.path.isdir(output_directory):
        print(f'Error: Directory {output_directory} does not exist.')
        sys.exit(1)

    # Add URLs to queue
    with open(input_filename, 'r') as f:
        urls = f.read().splitlines()
    for url in urls:
        queue.put_nowait(url)

    async with async_playwright() as p:
        browser = await p.chromium.launch()
        # Create 10 worker tasks
        worker_tasks = [asyncio.create_task(worker(browser)) for _ in range(20)]
        # Wait for all URLs to be processed
        await queue.join()

        # Cancel worker tasks
        for task in worker_tasks:
            task.cancel()

        # Shut down the browser
        await browser.close()

    # move the DB to the output directory
    os.rename(DB_NAME, f'{output_directory}/{DB_NAME}')


if __name__ == '__main__':
    asyncio.run(main())
