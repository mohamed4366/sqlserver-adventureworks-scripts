/* THIS SCRIPT creates the Person.AddressAudit table based on the (AdventureWorks(2019 OLTP)) sample database.
The purpose of this table is to record all INSERT and DELETE operations performed on Person.Address.
Each entry stores the address details along with the operation type (INS or DEL) and the timestamp (updated_at).
This makes AddressAudit an audit trail table for tracking changes to Person.Address */
CREATE TABLE person.AddressAudit(
change_ID INT IDENTITY(1,1) PRIMARY KEY, 
addressID INT NOT NULL,
addressline1 NVARCHAR(60) NOT NULL,
addressline2 NVARCHAR(60) NULL,
city NVARCHAR(30) NOT NULL,
StateProvinceID INT NOT NULL,
postalcode NVARCHAR(15) NOT NULL,
spatialLocation GEOGRAPHY NULL,
updated_at DATETIME NOT NULL,
operation CHAR(3) NOT NULL,
CHECK (operation IN('INS','DEL')));
GO
/* THIS SCRIPT creates a Trigger named trg_AddressAudit on the Person.Address table.
The purpose is to log all INSERT and DELETE operations into the AddressAudit table.
When a new row is inserted, its data is copied with the operation marked as 'INS' and the execution timestamp.
When a row is deleted, its data is copied with the operation marked as 'DEL' and the execution timestamp.
In this way, the AddressAudit table serves as an audit trail to track changes made to Person.Address */
CREATE TRIGGER person.Trg_AddressAudit
ON person.address
AFTER INSERT,DELETE
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO person.AddressAudit (
addressID,
addressline1,
addressline2,
city,
StateProvinceID,
postalcode,
spatialLocation,
updated_at,
operation) 
SELECT 
addressID,addressline1,addressline2,city,
StateProvinceID,postalcode,SpatialLocation,GETDATE(),'INS'
FROM inserted 
UNION ALL 
SELECT
addressID,addressline1,addressline2,city,
StateProvinceID,postalcode,SpatialLocation,GETDATE(),'DEL'
FROM deleted END 
GO
/* THIS SCRIPT inserts a test row into Person.Address to verify the trg_AddressAudit trigger.
The trigger automatically records the INSERT operation into Person.AddressAudit,
which serves as an audit trail table for tracking changes on Person.Address.
The final SELECT statement retrieves the logged entry from AddressAudit,
to confirm that the operation was successfully captured */
INSERT INTO Person.Address 
(AddressLine1,AddressLine2, 
City,StateProvinceID,PostalCode 
,rowguid,ModifiedDate) 
VALUES (N'TEST 1',N'TEST 
1',N'ALEXA',2,N'2016',NEWID(),GETDATE()); 
--TESTING INSERT IN AddrssAudit TABLE
SELECT *
FROM Person.addressaudit



































