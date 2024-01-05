
--Create a new database named "CompanyDB."
create database CompanyDB;
use CompanyDB;

--Design and create two tables: Employees and Departments.

--Departments table should have fields:
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255) not null
);

--Insert at least 5 records into the Departments table.
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance'),
	(4, 'Receptionist'),
	(5, 'Clerk');
	SELECT * FROM Departments;

--Employees table should have fields:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255) not null,
    LastName VARCHAR(255) not null,
    DepartmentID INT not null,
    Salary DECIMAL(10, 2) not null,
	FOREIGN KEY (DepartmentID) references  Departments(DepartmentID)
);

--Insert at least 10 records into the Employees table with appropriate DepartmentIDs.
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES
    (1, 'Rabia', 'Kanwal', 2, 68000.00),
    (2, 'Liza', 'Khan', 1, 50000.00),
    (3, 'Tooba', 'Sheikh', 5, 56000.00),
    (4, 'Fiza ', 'Naz', 3, 35000.00),
    (5, 'Alishba', 'Hashmi', 2, 45000.00),
    (6, 'Sarah', 'Imtiaz', 1, 22000.00),
    (7, 'Hamza', 'Khan', 3, 75000.00),
    (8, 'Osama', 'Khan', 2, 58000.00),
    (9, 'Maham', 'Sheikh', 1, 51000.00),
    (10, 'Raima', 'Rao', 3, 28000.00);
	
	SELECT * FROM Employees;

--Add a new column called "HireDate" (datetime) to the Employees table.
Alter table Employees add HireDate datetime;
UPDATE Employees SET HireDate ='2023-12-31' WHERE EmployeeID=1; 
UPDATE Employees SET HireDate ='2022-06-24' WHERE EmployeeID=2;
UPDATE Employees SET HireDate ='2021-12-31' WHERE EmployeeID=3;
UPDATE Employees SET HireDate ='2023-10-01' WHERE EmployeeID=4;
UPDATE Employees SET HireDate ='2020-12-31' WHERE EmployeeID=5;
UPDATE Employees SET HireDate ='2023-02-21' WHERE EmployeeID=6;
UPDATE Employees SET HireDate ='2023-12-31' WHERE EmployeeID=7;
UPDATE Employees SET HireDate ='2016-09-23' WHERE EmployeeID=8;
UPDATE Employees SET HireDate ='2023-12-31' WHERE EmployeeID=9;
UPDATE Employees SET HireDate ='2008-08-18' WHERE EmployeeID=10;

SELECT * FROM Employees;

--Update the salary of employees in the IT department(assuming IT has DepartmentID 1) to increase it by 10%
SELECT * FROM Departments;
UPDATE Employees SET Salary=Salary + (Salary*0.1) WHERE DepartmentID=2;
SELECT DepartmentID,FirstName,LastName,Salary FROM Employees WHERE DepartmentID=2;

--Delete the records of employees whose salaries are less than 30000.
DELETE FROM Employees WHERE Salary<30000;
SELECT * FROM Employees;

--Select Data using INNER JOIN:
--Write a SQL query to retrieve the FirstName, LastName, DepartmentName, and Salary of employees by joining the Employees
--and Departments tables.
SELECT EmployeeID,FirstName,LastName,Salary,DepartmentName FROM Employees AS emp join Departments as
dep on emp.DepartmentID=dep.DepartmentID;

--Select Data using LEFT JOIN:
--Write a SQL query to retrieve all departments and the number of employees in each department, even if
--there are no employees in that department.
SELECT * FROM Departments as dep left join Employees as emp on dep.DepartmentID=emp.DepartmentID;
SELECT  COUNT(*) AS Number_of_Employees FROM Departments as dep left join Employees as emp on dep.DepartmentID=emp.DepartmentID;

--Select Data using WHERE and JOIN:
--Write a query to select the FirstName, LastName, and HireDate of employees who were hired after '2023-01-01'.
SELECT FirstName, LastName,HireDate FROM Employees WHERE HireDate>'2023-01-01';
SELECT  FirstName, LastName,HireDate FROM Employees as emp join Departments as dep
on emp.DepartmentID=dep.DepartmentID WHERE HireDate>'2023-01-01';