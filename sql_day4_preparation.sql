use company;
select * from employeedetails e
join Employeesalary s on e.empid = s.EmpId;


-- 13 Write an SQL query to fetch records that are 
-- present in one table but not in another table
SELECT e.* FROM EmployeeDetails e
LEFT JOIN EmployeeSalary s ON e.EmpId = s.EmpId;


/* inner join used to that selects 
records that have matching values in both tables */
select e.empid,e.fullname,s.project from employeedetails e
inner join employeesalary s on e.managerid = s.empid;

/*LEFT (OUTER) JOIN: Returns all records from the left table,
 and the matched records from the right table */
select s.project from employeedetails e
left join employeesalary s on e.managerid = s.empid;

/* RIGHT (OUTER) JOIN: Returns all records from the right table,
and the matched records from the left table */
select s.project,s.empid,e.managerid from employeedetails e
right join employeesalary s on e.managerid = s.empid;


--  it shows the null records row
select s.project,s.empid,e.managerid from employeedetails e
right join employeesalary s on e.managerid = s.empid
WHERE e.EmpId IS NULL;

-- 14. Write an SQL query to fetch the EmpIds that are present 
-- in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.

select empid from employeedetails
where empid in (select empid from employeesalary);

-- 15. Write an SQL query to fetch the EmpIds that are present in
-- EmployeeDetails but not in EmployeeSalary.

SELECT EmpId FROM EmployeeDetails 
where EmpId Not IN 
(SELECT EmpId FROM EmployeeSalary);

-- 16. Write an SQL query to fetch the employee’s full names 
-- and replace the space with ‘-’.

select fullname from employeedetails;
SELECT REPLACE(FullName, ' ', '-') fullname
FROM EmployeeDetails;

-- 17. Write an SQL query to fetch the position of a given 
-- character(s) in a field.
select fullname , instr(fullname,'white') position_of_letter
from employeedetails;

-- 18. Write an SQL query to display both the EmpId 
-- and ManagerId together.

select empid,managerid from employeedetails;

-- concatenating both the values not adding 
SELECT CONCAT(EmpId, ManagerId) as NewId
FROM EmployeeDetails;

-- adding and it giving the total sum
SELECT EmpId+ManagerId as NewId
FROM EmployeeDetails;




