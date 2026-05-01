-- This Script in this file are based on the (AdventureWorks(2019 OLTP)) sample database

/* THIS SCRIPT retrieves customers (CustomerID, FirstName, LastName)
by joining Sales.Customer with Person.Person to display their names
A subquery is used inside the EXISTS clause to check Sales.SalesOrderHeader
and ensure that each customer has placed more than 20 orders.
Only customers meeting this condition are returned,and results are
ordered alphabetically by FirstName and LastName */

SELECT C.CustomerID,P.FirstName,P.LastName
FROM Sales.Customer C
INNER JOIN Person.Person P
ON P.BusinessEntityID = C.PersonID
WHERE EXISTS (select CustomerID,COUNT(*)
FROM Sales.SalesOrderHeader
WHERE CustomerID = C.CustomerID
GROUP BY CustomerID
HAVING COUNT(*) >20)
ORDER BY FirstName,LastName;