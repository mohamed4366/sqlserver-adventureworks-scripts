/* General Comment:
This set of scripts includes the following:
1. A script to create the necessary schema structure.
2. A script to create a table with a Primary Key constraint.
3. A script to create a table with a Foreign Key constraint.
4. A script to add CHECK constraints to ensure data integrity.
Each script is designed to handle a specific aspect of the database structure, 
from defining the schema to enforcing constraints on the data */

-- Create new schema for organizing database objects
CREATE SCHEMA productions
GO
-- Create productsubcategory table with a primary key constraint on productsubcategoryID
Create Table productions.ProductSubcategory (
ProductSubcategoryID INT NOT NULL IDENTITY(1,1)
CONSTRAINT pk_productsubcategory_productsubcategoryID PRIMARY KEY CLUSTERED ,
productcategoryID INT NOT NULL ,
Name NVARCHAR(100) NOT NULL ,
rowguid UNIQUEIDENTIFIER  ROWGUIDCOL NOT NULL ,
ModifiedDate DATETIME NOT NULL ) ;
GO
-- Test table creation here.
SELECT *
FROM productions.ProductSubcategory

----------------------------->>>>>>>>>>>>>>>>>------------------------------

-- Create products table with a foreign key linking productsubcategoryID to productsubcategory table
CREATE TABLE productions.products(
productID INT NOT NULL IDENTITY(1,1) PRIMARY KEY ,
name NVARCHAR(100) NOT NULL ,
product_number NVARCHAR(25) NOT NULL ,
productsubcategoryID INT NULL
CONSTRAINT fk_products_productsubcategory_productsubcategoryID FOREIGN KEY (productsubcategoryID)
REFERENCES productions.productsubcategory (productsubcategoryID) 
/*THIS SCRIPT applies ON UPDATE CASCADE and ON DELETE CASCADE
Purpose: Ensures that changes or deletions in the parent table(productions.ProductSubcategory)
are automatically propagated to the child table(productions.products)
This maintains referential integrity and simplifies data management */
ON UPDATE CASCADE
ON DELETE CASCADE ,);
GO
-- Test table creation here.
SELECT *
FROM productions.products


-- Add check constraint on products table to ensure NAME starts with a capital letter 
ALTER TABLE productions.products WITH CHECK ADD CONSTRAINT ck_products_name  CHECK (NAME LIKE '[A-Z]%')









