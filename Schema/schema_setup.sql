-- Create new schema for organizing database objects
CREATE SCHEMA productions

-- Create productsubcategory table with a primary key constraint on productsubcategoryID
Create Table productions.ProductSubcategory (
ProductSubcategoryID INT NOT NULL IDENTITY(1,1)
CONSTRAINT pk_productsubcategory_productsubcategoryID PRIMARY KEY CLUSTERED ,
productcategoryID INT NOT NULL ,
Name NVARCHAR(100) NOT NULL ,
rowguid UNIQUEIDENTIFIER  ROWGUIDCOL NOT NULL ,
ModifiedDate DATETIME NOT NULL ) 

-- Create products table with a foreign key linking productsubcategoryID to productsubcategory table
CREATE TABLE productions.products(
productID INT NOT NULL IDENTITY(1,1) PRIMARY KEY ,
name NVARCHAR(100) NOT NULL ,
product_number NVARCHAR(25) NOT NULL ,
productsubcategoryID INT NULL
CONSTRAINT fk_products_productsubcategory_productsubcategoryID FOREIGN KEY (productsubcategoryID)
REFERENCES productions.productsubcategory (productsubcategoryID) 
ON UPDATE CASCADE
ON DELETE CASCADE ,)


-- Add check constraint on products table to ensure NAME starts with a capital letter 
ALTER TABLE productions.products WITH CHECK ADD CONSTRAINT ck_products_name  CHECK (NAME LIKE '[A-Z]%')









