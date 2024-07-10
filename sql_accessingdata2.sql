use company;
select *
from employeedetails e
join Employeesalary s on e.empid = s.EmpId;

-- 7. Write an SQL query to fetch all the employees who either
-- live in California or work under a manager with ManagerId–321

select fullname,empid,managerid,city from employeedetails
where city = 'California' or managerid = '321';

-- 8. Write an SQL query to fetch all those 
-- employees who work on Projects other than P1.

select e.empid,e.fullname,e.city from employeesalary s
join employeedetails e on e.empid = s.EmpId
where not project =  'P1';
-- (or)
-- WHERE Project <> 'P1';

-- 9. Write an SQL query to display the total salary of each 
-- employee adding the Salary with Variable value(compensation amount).

SELECT EmpId,salary,
Salary+Variable as TotalSalary 
FROM EmployeeSalary;

/* 10. Write an SQL query to fetch the employees whose name 
 begins with any two characters, followed by a text “hn”
  and ends with any sequence of characters.*/
  
  select empid,fullname from employeedetails
  where fullname like '__hn%';
  
 /* 11. Write an SQL query to fetch all the EmpIds which are 
 present in either of the tables ‘EmployeeDetails’ 
 and ‘EmployeeSalary’*/ 
 
select empid from employeedetails
union
select empid from employeesalary;

-- 12. Write an SQL query to fetch common records between 
-- two tables.

SELECT managerid FROM EmployeeDetails
INTERSECT
SELECT empid FROM EmployeeSalary;
-- mysql doesn't have intersect operator so use a subquery

select * from employeesalary
where empid in (select empid from employeedetails);








  








