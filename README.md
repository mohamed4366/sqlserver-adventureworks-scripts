# Table with Clustered & Non-Clustered Indexes

This file contains an SQL script for creating a sample table, inserting test data, and applying two types of indexes (Clustered and Non-Clustered).

## File
- **01_indexing_strategies.sql**  
Includes:  
1. Table structure.  
2. Test data inserted into the table.  
3. Clustered index to organize rows by the indexed column.  
4. Non-Clustered index to improve query performance on specific columns.  

## Purpose
To demonstrate database design and indexing skills in SQL Server by:  
- Creating a table with test data.  
- Applying a **Clustered Index** to control the physical order of rows.  
- Applying a **Non-Clustered Index** to optimize query performance without changing the row order.  

## Usage
1. Open **SQL Server Management Studio (SSMS)**.  
2. Execute the scripts in order (create table → insert data → clustered index → non-clustered index).  
3. Run `SELECT` queries to observe performance differences when using indexes.  

## Notes
This example highlights the difference between two types of indexes:  
- **Clustered Index** → Stores rows sorted by the indexed column.  
- **Non-Clustered Index** → Creates a separate structure pointing to rows, allowing faster lookups on specific columns.  
