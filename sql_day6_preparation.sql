use company;
select * from employeedetails;

-- 25. Write an SQL query to find the current date-time
select now();

-- 26. Write an SQL query to fetch all the Employee details 
-- from the EmployeeDetails table who joined in the Year 2020

SELECT * FROM EmployeeDetails
WHERE DateOfJoining BETWEEN '2020/01/01' AND '2020/12/31';

/* 27.Write an SQL query to fetch all employee records 
from the EmployeeDetailstable who have a
 salary record in the EmployeeSalary table. */
 
 SELECT * FROM EmployeeDetails e
WHERE EXISTS (SELECT * FROM EmployeeSalary s
WHERE  e.EmpId = s.EmpId);
 
 /* 28. Write an SQL query to fetch the project-wise 
 count of employees sorted by project’s 
 count in descending order. */
 
select project,count(empid) as countofempid from employeesalary
group by project;


-- 28. Write an SQL query to fetch the project-wise count of 
-- employees sorted by project’s count in descending order.

SELECT Project, count(EmpId) EmpProjectCount
FROM EmployeeSalary
GROUP BY Project;

/* 29. Write a query to fetch employee names and salary 
records. Display the employee details 
even if the salary record is not present for the employee. */

SELECT e.FullName, s.Salary FROM EmployeeDetails e
LEFT JOIN EmployeeSalary s ON e.EmpId = s.EmpId;

-- 30. Write an SQL query to join 3 tables.
-- SELECT column1, column2
-- FROM TableA
-- JOIN TableB ON TableA.Column3 = TableB.Column3
-- JOIN TableC ON TableA.Column4 = TableC.Column4;
 
 
