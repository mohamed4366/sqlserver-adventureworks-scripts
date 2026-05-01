-- All scripts in this file are based on the (AdventureWorks(2019 OLTP)) sample database
/* This script uses (DISTINCT) to remove duplicate rows
 and ensure only unique values are returned */
 SELECT DISTINCT City,PostalCode
 FROM Person.Address;


/* This script uses comparison operators (AND, >) 
to filter products where ProductSubcategoryID = 3 AND ListPrice > 2000 */
SELECT ProductID,Name,Color,StandardCost,ProductSubcategoryID,ListPrice,Size
FROM Production.Product
WHERE ProductSubcategoryID =3 AND ListPrice >2000;


/* This script uses the (BETWEEN) comparison operator to filter products 
where ListPrice BETWEEN 3500 AND 4000, and applies (ORDER BY) to sort results */
SELECT ProductID,Name,Color,StandardCost,ListPrice,Size
FROM production.product
WHERE ListPrice BETWEEN 3500 AND 4000
ORDER BY ListPrice DESC;


/* This script applies the (LIKE) comparison operator with the pattern '[^a-m]%' 
to filter products whose names start with letters outside the range A–M 
and uses (ORDER BY) to sort the results descending according to list price */
SELECT ProductID,Name,Color,StandardCost,ListPrice,Size
FROM Production.Product
WHERE Name LIKE '[^a-m]%'
ORDER BY ListPrice DESC;





