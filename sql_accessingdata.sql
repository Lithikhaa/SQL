use company;

select e.empid,e.fullname,e.managerid,e.dateofjoining,
e.city,s.Project,s.Salary,s.Variable
from employeedetails e
join EmployeeSalary s ON e.empId = s.EmpId; 

-- 1. Write an SQL query to fetch the EmpId and FullName of
-- all the employees working under the Manager with id – ‘986’.
select e.empid,e.fullname from employeedetails e
where managerid = 986;

-- 2. Write an SQL query to fetch different projects
--  available from the EmployeeSalary table
select distinct (project) from employeesalary;

-- 3. Write an SQL query to fetch the count of employees 
-- working in project ‘P1’.
select count(*) total_count_p1workers from employeesalary
where Project='P1';

-- ordering the fullname
select fullname from employeedetails
order by fullname;

-- to view diff data from  table1 and table2
select e.fullname,s.salary from employeedetails e
join employeesalary s on e.empId = s.EmpId;

-- 4.Write an SQL query to find the maximum, minimum, 
-- and average salary of the employees
select max(salary),min(salary),avg(salary) from employeesalary;

-- 5. Write an SQL query to find the employee id whose salary
-- lies in the range of 9000 and 15000.
select empid,salary from employeesalary 
where salary between 9000 and 15000;

-- (OR)
select e.empid,e.fullname,s.salary from employeedetails e
join employeesalary s on e.empid = s.EmpID
where salary between 9000 and 15000;

-- 6.6. Write an SQL query to fetch those employees who live in
 -- Toronto and work under the manager with ManagerId – 321.
select empid,city,fullname,managerid from employeedetails
where city = 'Toronto' and managerid = 321;













