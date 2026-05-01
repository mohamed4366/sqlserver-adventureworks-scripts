/* THIS SCRIPT retrieves sales orders from Sales.SalesOrderHeader
for the year 2011 in the (AdventureWorks(2019 OLTP)) sample database.
It calculates Order_Value from SubTotal and classifies each order
into categories (Very Low, Low, Medium, High, Very High)
using the (CASE) expression based on SubTotal ranges.
Results are ordered by SalesOrderID for clarity. */

SELECT SalesOrderID,SubTotal AS Order_Value,
CASE 
WHEN SubTotal <= 500 THEN 'Very Low'
WHEN SubTotal >500 AND SubTotal <= 1000 THEN 'Low'
WHEN SubTotal >1000 AND SubTotal <= 5000 THEN 'Meduim'
WHEN SubTotal >5000 AND SubTotal <= 10000 THEN 'High'
WHEN SubTotal > 10000 THEN 'Very High' END AS Order_Priority
FROM Sales.SalesOrderHeader 
WHERE YEAR(OrderDate) = 2011
ORDER BY SalesOrderID;

