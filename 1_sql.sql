-- SELECT -> FROM -> WHERE
-- ============================================ SELECT ============================================    
SELECT * FROM Customers;
SELECT CustomerName, City FROM Customers; 
SELECT DISTINCT Country FROM Customers; 
SELECT DISTINCT Country,City FROM Customers;
SELECT COUNT(DISTINCT Country) FROM Customers; 
SELECT Count(*) AS DistinctCountries FROM (SELECT DISTINCT Country FROM Customers);
SELECT * FROM Customers WHERE Country='Mexico';  -- [=,>,<,>=,<=,<>,BETWEEN,LIKE,IN]
SELECT * FROM Products WHERE Price <> 18; -- Not equal. Note: In some versions of SQL this operator may be written as !=
SELECT * FROM Products WHERE Price BETWEEN 50 AND 60;
SELECT * FROM Customers WHERE City LIKE 's%';
SELECT * FROM Customers WHERE City IN ('Paris','London');
SELECT * FROM Products ORDER BY Price DESC;  -- ASC|DESC
SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC; 
SELECT * FROM Customers WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'A%');
SELECT * FROM Customers WHERE NOT Country = 'Spain';
SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NULL;
SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NOT NULL;
-- ============================================ INSERT INTO ===========================================

INSERT INTO Customers VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country) VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');

-- ============================================  UPDATE  ==============================================
UPDATE Customers SET ContactName = 'Alfred Schmidt', City= 'Frankfurt' WHERE CustomerID = 1;

-- ============================================   DELETE   ============================================== 
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';  -- deletes all rows in the "Customers" table, without deleting the table


-- ============================================      ============================================== 





-- ============================================      ============================================== 





-- ============================================   CREATE DATABASE   ============================================== 
CREATE DATABASE testDB; 

SHOW DATABASES;


-- ============================================   DROP DATABASE   ============================================== 
DROP DATABASE testDB; 




-- ============================================   BACKUP DATABASE   ============================================== 

BACKUP DATABASE databasename TO DISK = 'filepath'; 

-- A differential back up only backs up the parts of the database that have changed since the last full database backup.
-- Tip: A differential back up reduces the back up time (since only the changes are backed up).
BACKUP DATABASE databasename TO DISK = 'D:\backups\testDB.bak' WITH DIFFERENTIAL; 

-- ============================================   CREATE TABLE    ============================================== 

CREATE TABLE table_name AS SELECT customername, contactname FROM customers;

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

CREATE TABLE Persons (
    PersonID int NOT NULL,  -- NOT NULL
    LastName varchar(255) NOT NULL UNIQUE , --NOT NULL UNIQUE
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
    CONSTRAINT UC_Person UNIQUE (ID,LastName) --multiple columns
);

-- ============================================  DROP TABLE    ============================================== 
 DROP TABLE Shippers;  -- delete the table completely


TRUNCATE TABLE table_name; --The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself.
 
-- ============================================   ALTER TABLE    ============================================== 
-- adds-DROP-rename-change_data_type  column
ALTER TABLE Customers ADD Email varchar(255); --adds column 
ALTER TABLE Customers DROP COLUMN Email;  --DROP  column 
ALTER TABLE table_name RENAME COLUMN old_name to new_name;  --rename  column 
ALTER TABLE Persons ALTER COLUMN DateOfBirth year;  -- change the data type of the column  [ALTER/MODIFY] SOME RDBMS

-- ============================================  Constraints    ============================================== 
ALTER TABLE Persons ALTER COLUMN Age int NOT NULL;  --To create a NOT NULL constraint

--The UNIQUE constraint ensures that all values in a column are different.
--A PRIMARY KEY constraint automatically has a UNIQUE constraint.
--However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.
ALTER TABLE Persons ADD UNIQUE (ID); 
ALTER TABLE Persons ADD CONSTRAINT UC_Person UNIQUE (ID,LastName); 

ALTER TABLE Persons DROP INDEX UC_Person;  -- [INDEX / CONSTRAINT ] SOME RDBMS