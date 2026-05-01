-- This Script in this file are based on the (AdventureWorks(2019 OLTP)) sample database

/* THIS SCRIPT retrieves persons with their city and assigns a sequential number 
to each person within the same city using the (ROW_NUMBER) window function. 
The numbering is partitioned by City and ordered by FirstName */

SELECT ROW_NUMBER() OVER (PARTITION BY a.city ORDER BY p.firstname ) ROW_NUM,
a.City,p.FirstName,p.LastName
FROM Person.Person p
INNER JOIN Person.BusinessEntityAddress bea
ON p.BusinessEntityID = bea.BusinessEntityID
INNER JOIN Person.Address a
ON a.AddressID = bea.AddressID
ORDER BY a.City;