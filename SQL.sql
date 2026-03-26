DROP DATABASE IF EXISTS stock_market_project;

CREATE DATABASE stock_market_project;

USE stock_market_project;

CREATE TABLE stock_data (
    Date DATE,
    Stock VARCHAR(10),
    Open DOUBLE,
    High DOUBLE,
    Low DOUBLE,
    Close DOUBLE,
    Volume BIGINT,
    Daily_Return DOUBLE,
    Log_Return DOUBLE,
    MA_20 DOUBLE,
    MA_50 DOUBLE,
    Volatility_20 DOUBLE
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/feature_engineered_stock_data.csv'
INTO TABLE stock_data
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Date, Stock, Open, High, Low, Close, Volume, Daily_Return, Log_Return, MA_20, MA_50, Volatility_20)
SET Date = STR_TO_DATE(@Date,'%d-%m-%Y');

SELECT COUNT(*) FROM stock_data;

SELECT * FROM stock_data LIMIT 10;

SELECT Stock, COUNT(*) AS Total_Records
FROM stock_data
GROUP BY Stock
ORDER BY Total_Records DESC;

SELECT Stock,
       ROUND(AVG(Close),2) AS Avg_Close_Price
FROM stock_data
GROUP BY Stock
ORDER BY Avg_Close_Price DESC;


SELECT Stock,
       MAX(Close) AS Highest_Close
FROM stock_data
GROUP BY Stock
ORDER BY Highest_Close DESC;


SELECT Stock,
       MIN(Close) AS Lowest_Close
FROM stock_data
GROUP BY Stock
ORDER BY Lowest_Close;

SELECT Stock,
       ROUND(AVG(Daily_Return),4) AS Avg_Daily_Return
FROM stock_data
GROUP BY Stock
ORDER BY Avg_Daily_Return DESC;

SELECT Stock,
       ROUND(AVG(Volatility_20),4) AS Avg_Volatility
FROM stock_data
GROUP BY Stock
ORDER BY Avg_Volatility DESC;

SELECT Stock,
       SUM(Volume) AS Total_Trading_Volume
FROM stock_data
GROUP BY Stock
ORDER BY Total_Trading_Volume DESC;


SELECT Stock,
       YEAR(Date) AS Year,
       MONTH(Date) AS Month,
       ROUND(AVG(Close),2) AS Avg_Close
FROM stock_data
GROUP BY Stock, Year, Month
ORDER BY Stock, Year, Month;


SELECT Date,
       Stock,
       Close,
       MA_20,
       MA_50
FROM stock_data
ORDER BY Date;


SELECT Stock, Date, Volume
FROM stock_data
ORDER BY Volume DESC
LIMIT 10;


SELECT * FROM stock_data;