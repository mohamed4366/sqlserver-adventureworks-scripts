-- This Script in this file are based on the (AdventureWorks(2019 OLTP)) sample database

/* THIS SCRIPT calculates the net sales for each sales staff member by summing up order quantity * unit price * (1 - unit price discount) from the order details.
It joins the SalesOrderHeader, SalesOrderDetail, SalesPerson, and Person.Person tables to get the staff member’s full name and link it to their orders.
A CTE (Common Table Expression) is used to aggregate the results by staff and year.
Finally, it filters the output to show results only for the year 2014 */

WITH CTE AS(
SELECT P.FirstName+' '+P.LastName AS Staff,
SUM(orderqty * unitprice * (1-unitpricediscount)) AS Net_sales,
YEAR(orderdate) AS Year 
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesOrderDetail SOD
ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Sales.SalesPerson SP
ON SP.BusinessEntityID = SOH.SalesPersonID
INNER JOIN Person.Person P
ON p.BusinessEntityID = SP.BusinessEntityID
GROUP BY P.FirstName+' '+P.LastName,YEAR(orderdate) )
SELECT *
FROM CTE 
WHERE YEAR = 2014 

