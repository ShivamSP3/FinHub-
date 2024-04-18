const puppeteer = require('puppeteer');

async function scrapeTradingViewData() {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  // Navigate to the TradingView page
  await page.goto('https://www.tradingview.com/markets/stocks-india/market-movers-active/');

  // Wait for the table to load
  await page.waitForSelector('.tv-data-table > tbody > tr');

  // Extract the desired data
  const stocks = await page.evaluate(() => {
    const rows = Array.from(document.querySelectorAll('.tv-data-table > tbody > tr'));
    const stocksArray = [];

    rows.forEach(row => {
      const symbol = row.querySelector('.tv-screener__symbol').innerText.trim();
      const name = row.querySelector('.tv-screener__description').innerText.trim();
      const last = row.querySelector('.tv-screener__last').innerText.trim();
      const change = row.querySelector('.tv-screener__change').innerText.trim();
      const changePercent = row.querySelector('.tv-screener__change--p').innerText.trim();

      stocksArray.push({ symbol, name, last, change, changePercent });
    });

    return stocksArray;
  });

  await browser.close();

  // Print the extracted data
  console.log(stocks);
}

scrapeTradingViewData();
