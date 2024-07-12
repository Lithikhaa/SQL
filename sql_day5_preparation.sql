use company;
select * from employeedetails e
join Employeesalary s on e.empid = s.EmpId;


/* 19. Write a query to fetch only the first name
(string before space) from th FullName 
column of the EmployeeDetails table. */

-- MID(string, start, length)
-- MID('John Doe', 1, 5)  --> here 1 is starting position of J and 5 is the space position
-- LOCATE(substring, string) --> it first finds the space in name of the string
-- LOCATE(' ', 'John Doe')

SELECT MID(FullName, 1, LOCATE(' ',FullName)) as firstname
FROM EmployeeDetails;

-- 20. Write an SQL query to uppercase the name of the 
-- employee and lowercase the city values.

select upper(fullname) fullname, lower(city) city from employeedetails;

/* 21. Write an SQL query to find the count of the total 
occurrences of a particular character – ‘n’ in the FullName 
field. */

/* eg john dennon --> length = 11
REPLACE(FullName, 'n', '') -- > first it replace the n into ''
eg  john dennon --> joh  deo -->length(replace()) = 8
11 - 8 =  3 so 'n' occured for 3 times in string */


SELECT FullName, 
LENGTH(FullName) - LENGTH(REPLACE(FullName, 'n', '')) as count_of_n
FROM EmployeeDetails;

-- 22. Write an SQL query to update the employee names by
--  removing leading and trailing spaces.

-- ' John Doe '
-- 'John Doe'  (it removes the begin spaces and end spaces)

update employeedetails
set fullname = ltrim(rtrim(fullname));

-- 23. Fetch all the employees who are not working on 
-- any project.

SELECT EmpId FROM EmployeeSalary 
WHERE Project = null;

-- (OR)

SELECT EmpId FROM EmployeeSalary 
WHERE Project IS NULL;

/* 24. Write an SQL query to fetch employee names having a 
salary greater than or equal to 5000 
and less than or equal to 10000.*/

select e.fullname , s.salary from employeedetails e
join employeesalary s on e.empid = s.empid
where s.salary between 5000 and 10000;
-- (OR)
SELECT FullName FROM EmployeeDetails 
WHERE EmpId IN (SELECT EmpId FROM EmployeeSalary 
WHERE Salary BETWEEN 5000 AND 10000);

























