--This script demonstrates how to create a table and apply both clustered and non-clustered indexes on columns to improve query performance. 
CREATE TABLE parts(
part_id INT NOT NULL,
part_name VARCHAR(100) );
GO
-- Step: Insert sample data into the table
INSERT INTO parts (part_id,part_name)
VALUES(1,'frame'),
      (2,'head tube'),
      (3,'Handlebar Grip'),
      (4,'Shock Absorber'),
      (5,'fork');
GO
-- Purpose: To demonstrate how a clustered index is applied, which stores the table rows sorted by the indexed column to improve query performance.
CREATE CLUSTERED INDEX ix_parts_part_id ON parts (part_id);

-- Purpose: To run a query on the table after creating a clustered index; in this case, the system relies on the index to execute the query faster, thereby improving performance.
-- Use the (execution plan) to analyze the performance of this query
SELECT *
FROM parts WHERE part_id = 5;

---------------------------->>>>>>>>>>>>>>-------------------------------


-- Purpose: Demonstrates applying a non-clustered index to improve query performance without altering the physical order of table rows
CREATE NONCLUSTERED INDEX ix_parts_part_name ON parts (part_name);

-- Purpose: To run a query on the table after creating a non-clustered index; in this case, the system relies on the index to execute the query faster, thereby improving performance.
-- Use the execution plan to analyze the performance of this query
SELECT *
FROM parts WHERE part_name = 'head tube';


