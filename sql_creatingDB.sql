
-- creating a database
create database company;  

-- using that database
use company;

-- creating table 1
-- creating a table and adding the column name
create table employeedetails(
empid int primary key,
fullname varchar(30),
managerid int,
dateofjoining date,
city varchar(30));

-- showing the tables that are exists
describe employeedetails;
show tables;

-- inserting a values in orderwise,and by using select command can able to view the inserted values
INSERT INTO employeedetails VALUES (121, 'John Snow', 321, '2019-01-31', 'Toronto');
INSERT INTO employeedetails VALUES (321, 'walter white', 986, '2020-01-30', 'California');
INSERT INTO employeedetails VALUES (421, 'kuldeep rana', 876, '2021-11-27', 'Newdelhi');
SELECT * FROM employeedetails;

-- to view a specific record use this
SELECT * FROM employeedetails WHERE EmpId = 121;

-- creating a table 2
-- the empid is same in both the table1,table2 so linking both table1 and table2  using foreign key and references
CREATE TABLE EmployeeSalary (
    EmpId INT,
    Project VARCHAR(10),
    Salary DECIMAL(10, 2),
    Variable DECIMAL(10, 2),
    FOREIGN KEY (EmpId) REFERENCES EmployeeDetails(EmpId)
);

INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable)
VALUES 
(121, 'P1', 8000, 500),
(321, 'P2', 10000, 1000),
(421, 'P1', 12000, 0);

SELECT * FROM EmployeeSalary;

-- employeedetails as e 
-- employeesalary as s
-- by using join command it just joins the multiple tables
-- e.empId = s.EmpId based on this condition only it joins

select e.empid,e.fullname,e.managerid,e.dateofjoining,
e.city,s.Project,s.Salary,s.Variable
from employeedetails e
join EmployeeSalary s ON e.empId = s.EmpId; 



