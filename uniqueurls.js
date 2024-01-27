const puppeteer = require("puppeteer-extra");
const StealthPlugin = require("puppeteer-extra-plugin-stealth");
const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');
const _ = require('lodash');

puppeteer.use(StealthPlugin());

const MAX_TABS = 10;
const TIMEOUT = 15000;

let db = new sqlite3.Database(':memory:', (err) => {
    if (err) {
        console.error(err.message);
    }
});

db.run(`CREATE TABLE url_info (
    domain TEXT,
    url TEXT,
    status INTEGER,
    content_length INTEGER,
    content TEXT
);`);

function getDomain(url) {
    let urlObj = new URL(url);
    return urlObj.hostname;
}

async function readContent(filePath) {
    return new Promise((resolve, reject) => {
        fs.readFile(filePath, 'utf-8', (err, data) => {
            if (err) {
                return reject(err);
            }

            const urls = data.split('\n');
            resolve(urls);
        });
    });
}

async function writeContent(filePath, content) {
    return new Promise((resolve, reject) => {
        fs.writeFile(filePath, content, 'utf-8', err => {
            if (err) {
                return reject(err);
            }

            resolve();
        });
    });
}

async function processUrl(url, page) {
  try {
      console.log(`Processing URL: ${url}`);
      let response = await page.goto(url, { waitUntil: 'networkidle2', timeout: TIMEOUT });
      let responseData = await page.evaluate(() => ({
          content_length: document.documentElement.innerHTML.length,
          content: document.documentElement.innerHTML
      }));

      db.run(`INSERT INTO url_info(domain, url, status, content_length, content) VALUES(?, ?, ?, ?, ?)`, [
          getDomain(url), url, response.status(), responseData.content_length, responseData.content
      ]);

  } catch (error) {
      console.error(`Unable to process url ${url}. Error: ${error}`);
  } finally {
      await page.close();
  }
}

function analyzeResults(inputFilePath, outputFilePath) {
    readContent(inputFilePath).then(urls => {
        (async () => {
            const browser = await puppeteer.launch({ headless: true, ignoreHTTPSErrors: true,
            args: [
                '--disable-features=IsolateOrigins,site-per-process,SitePerProcess',
                '--flag-switches-begin --disable-site-isolation-trials --flag-switches-end',
                '--disable-dev-shm-usage',
                '--disable-setuid-sandbox',
                '--no-first-run',
                '--no-sandbox',
                '--no-zygote',
                '--deterministic-fetch',
                '--disable-features=IsolateOrigins',
                '--ignore-certificate-errors',
                '--enable-features=NetworkService',
            ]});
            const queue = [...urls];
            let ongoing = 0;

            while (queue.length > 0 || ongoing > 0) {
                while (ongoing < MAX_TABS && queue.length > 0) {
                    ++ongoing;
                    const page = await browser.newPage();
                    processUrl(queue.shift(), page).finally(() => --ongoing);
                }

                await new Promise(resolve => setTimeout(resolve, 1000));
            }

            await browser.close();

            db.all(`SELECT * FROM url_info`, (err, rows) => {
              if (err) {
                  console.error(err.message);
              }

              let grouped = _.groupBy(rows, 'domain');

              // For each domain, check each URL
              let uniqueUrls = Object.values(grouped).flatMap(group => {
                // Sort the URLs so we compare each one to the next
                let sortedGroup = _.sortBy(group, ['status', 'url']);
  
                // Keep only the unique URLs
                return _.uniqWith(sortedGroup, (a, b) => {
                  // If URLs have different status codes they are unique
                  if (a.status !== b.status) return false;
    
                  // Check content uniqueness
                  let jaccardSimilarity = computeJaccardSimilarity(a.content, b.content);
                  return jaccardSimilarity > 0.9;
                });
                }).map(row => row.url);
  
                console.log(uniqueUrls);

                writeContent(outputFilePath, uniqueUrls.join('\n')).then(() => {
                    console.log(`Unique urls written to file ${outputFilePath}`);
                    db.close();
                });
            });
        })();
    });
}

function computeJaccardSimilarity(a, b) {
  let charsA = Array.from(new Set(a.split('')));
  let charsB = Array.from(new Set(b.split('')));
  let intersection = charsA.filter(char => charsB.includes(char));
  let union = Array.from(new Set([...charsA, ...charsB]));
  return intersection.length / union.length;
}

if (process.argv.length < 4) {
    console.error(`Usage: ${process.argv[0]} ${process.argv[1]} [input file path] [output file path]`);
    process.exit(1);
}

let inputFilePath = process.argv[2];
let outputFilePath = process.argv[3];

analyzeResults(inputFilePath, outputFilePath);
