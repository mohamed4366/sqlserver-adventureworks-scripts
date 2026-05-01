/* THIS SCRIPT retrieves product information with related sales order details 
 from the (AdventureWorks (2019 OLTP)) sample database. 
 A(LEFT JOIN)is used to ensure all products are listed,
 even if they have no matching sales order (SalesOrderID = 48017) */

SELECT P.ProductID,P.Name,O.SalesOrderID,O.OrderQty,O.UnitPrice
FROM Production.Product P
LEFT JOIN Sales.SalesOrderDetail O
ON O.ProductID = P.ProductID AND O.SalesOrderID =48017
ORDER BY SalesOrderID DESC