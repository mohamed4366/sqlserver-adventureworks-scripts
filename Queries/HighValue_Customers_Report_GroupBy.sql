-- THIS script in this file are based on the (AdventureWorks(2019 OLTP)) sample database

/* THIS SCRIPT Retrieves customer names by concatenating first, middle (if available), and last names.
Groups sales data by customer and order year using GROUP BY to aggregate results.
Applies aggregate functions: COUNT, SUM, AVG, MAX, and MIN to analyze order activity.
Filters results with HAVING to include only customers whose total sales exceed 100,000 and minimum order value is above 30,000.
Orders the output by total sales in descending order for clear ranking */

SELECT P.FirstName+' '+ ISNULL(P.MiddleName,'') +P.LastName AS Customer_Name
,YEAR(SOH.orderdate) AS Order_By_Year
,COUNT(SOH.salesorderID) AS Number_Of_Orders
,SUM(SOH.subtotal) AS Total_Sales
,AVG(SOH.subtotal) AS Average_Orders
,MAX(SOH.subtotal) AS Maximum_Orders
,MIN(SOH.subtotal) AS Minimum_Orders 
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.Customer C
ON C.CustomerID = SOH.CustomerID
INNER JOIN Person.Person P
ON P.BusinessEntityID = C.PersonID
GROUP BY P.FirstName+' '+ ISNULL(P.MiddleName,'') +P.LastName,YEAR(orderdate)
HAVING SUM(subtotal) > 100000 AND MIN(subtotal) > 30000
ORDER BY Total_Orders DESC ;


