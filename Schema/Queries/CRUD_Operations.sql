-- All scripts in this file are based on the (AdventureWorks(2019 OLTP)) sample database
/* This script uses (INSERT) to add rows and (OUTPUT INSERTED)to capture identity (primary key) values */
INSERT INTO production.productsubcategory 
(productcategoryID,NAME) OUTPUT inserted.productsubcategoryID
VALUES(1,N'A BIKES'),
(1,'D BIKES'),
(1,'V BIKES'),
(1,'X BIKES'),
(1,'Z BIKES');


-- THIS SCRIPT updates SalesPerson quota with 2014 order subtotals using INNER JOIN
update Sales.SalesPerson
set SalesQuota = S.SUBTOTAL
from Sales.SalesPerson SP
INNER JOIN Sales.SalesOrderHeader s
ON s.SalesOrderID = sp.BusinessEntityID
WHERE YEAR(s.orderdate)=2014;
-- THIS SCRIPT tests the SalesPerson table after updating quotas by selecting all rows
SELECT * 
FROM Sales.SalesPerson;


-- THIS SCRIPT Uses (MERGE ) to identify non-matching rows and DELETE them from the source table
MERGE sales.addresses sa
USING person.address pa
ON pa.addressID = sa.address_ID
WHEN NOT MATCHED BY SOURCE  
THEN DELETE ;