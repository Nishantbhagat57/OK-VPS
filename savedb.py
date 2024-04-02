import asyncio
import os
import random
import sqlite3
import string
import sys
import time
from playwright.async_api import async_playwright
from playwright_stealth import stealth_async
import socket
from urllib.parse import urlparse

def get_domain(url: str) -> str:
    try:
        # separate the domain from port (if present)
        domain = urlparse(url).netloc.split(":")[0]
        socket.inet_aton(domain)
        return domain  # return IP if url is formatted as IP:PORT
    except socket.error:
        return urlparse(url).netloc  # return the original domain if not in valid IP format.

# Maximum number of concurrent tasks
CONCURRENT_TASKS = 6

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


async def fetch(browser, queue):
    url = await queue.get()  # fetch URL from queue here
    # Introduce a random sleep here between 5 - 30 ms
    await asyncio.sleep(random.randint(5, 30) / 1000.0)
    try:
        context = await browser.new_context(ignore_https_errors=True)
        # Apply stealth plugin
        await stealth_async(context) 
        page = await context.new_page()
        response = await page.goto(url, wait_until="networkidle", timeout=80000)
        content = await page.content()
        await context.close()

        status = response.status
        content_length = len(content)
        domain = get_domain(url)
        values = (domain, url, status, content_length, content)
        db.execute('''INSERT INTO url_info(domain, url, status, content_length, content)
        VALUES(?,?,?,?,?)''', values)
        conn.commit()
        print(f'Fetched: {url}')
    except Exception as e:
        print(f'Error in fetching: {url}')
        print(e)

    # The fetch function is a producer and it informs the queue that the task is done
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

    random.shuffle(urls)
    workers = []

    async with async_playwright() as p:
        # Select the desired browser
        browser_type = p.firefox

        # Define the launch arguments
        browser_type_launch_args = {"firefox_user_prefs": {"security.enterprise_roots.enabled": True}}

        # Launch the browser with the specified arguments
        browser = await browser_type.launch(**browser_type_launch_args)

        # Create initial set of worker tasks
        for _ in range(min(CONCURRENT_TASKS, len(urls))):
            queue.put_nowait(urls.pop())   # enqueue URL here
            workers.append(asyncio.create_task(fetch(browser, queue)))  # fetch it in the worker

        while True:
            # Wait for a worker to finish
            done, pending = await asyncio.wait(workers, return_when=asyncio.FIRST_COMPLETED)

            for task in done:
                workers.remove(task)

            # If there are still pending URLs, create more tasks
            while urls and len(workers) < CONCURRENT_TASKS:
                queue.put_nowait(urls.pop())  # enqueue URL here
                workers.append(asyncio.create_task(fetch(browser, queue)))  # fetch it in the worker

            # If no remaining URLs and all workers are done, break the loop
            if not urls and not workers:
                break

        # Wait for remaining tasks to finish
        await queue.join()

        # Shut down the browser
        await browser.close()

    # move the DB to the output directory
    os.rename(DB_NAME, f'{output_directory}/{DB_NAME}')

if __name__ == '__main__':
    asyncio.run(main())
