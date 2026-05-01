-- This Script in this file are based on the (AdventureWorks(2019 OLTP)) sample database

/* THIS SCRIPT dynamically builds a pivot query 
to summarize yearly freight costs by Ship Method
It uses SQL PIVOT to transform ship methods into columns 
providing a clear comparative view across years */

DECLARE @COLUMNS NVARCHAR(MAX) = '';
SELECT @COLUMNS += QUOTENAME(SM.NAME) + ','
FROM Purchasing.ShipMethod  SM
ORDER BY SM.NAME;
SET @COLUMNS = LEFT(@COLUMNS,LEN(@COLUMNS) - 1) ;
DECLARE @SQL NVARCHAR(MAX) = '';
SET @SQL ='SELECT* FROM (
SELECT /*POH.ShipMethodID,*/YEAR(POH.shipdate) AS YEAR,SM.Name AS Ship_Method,Freight
FROM Purchasing.PurchaseOrderHeader POH
INNER JOIN Purchasing.ShipMethod SM
ON SM.ShipMethodID = POH.ShipMethodID) T
PIVOT (SUM(freight) FOR Ship_Method IN ('+@COLUMNS+')) AS PIVOT_TABLE 
ORDER BY YEAR ASC;';
EXECUTE sp_executesql @sql; 

