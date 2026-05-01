/* This script creates the view Production.view_ProductAndDescription 
(based on AdventureWorks 2019 OLTP) with SCHEMABINDING to join product-related tables. 
A UNIQUE CLUSTERED INDEX is defined on (ProductID, CultureID) to improve performance 
and ensure uniqueness when querying the view */

CREATE VIEW Production.view_ProductAndDescription
WITH SCHEMABINDING AS
SELECT P.ProductID,P.Name,PM.Name AS ProductModel,
PMC.CultureID,PD.Description
FROM Production.Product P
INNER JOIN Production.ProductModel PM
ON P.ProductModelID = PM.ProductModelID
INNER JOIN Production.ProductModelProductDescriptionCulture PMC
ON PM.ProductModelID = PMC.ProductModelID
INNER JOIN Production.ProductDescription PD
ON PD.ProductDescriptionID = PMC.ProductDescriptionID
GO
CREATE UNIQUE CLUSTERED INDEX ix_view_ProductAndDescription
ON Production.view_ProductAndDescription (ProductID,CultureID)
GO

-- Validate the view in this section
SELECT *
FROM Production.view_ProductAndDescription



