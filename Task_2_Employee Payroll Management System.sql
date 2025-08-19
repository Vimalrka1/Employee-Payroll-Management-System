--2.1 a)Database created 'Payroll database'
--2.2 b) Create a table 'employee'

create table employees 
(EMPLOYEE_ID INTEGER PRIMARY KEY,
NAME TEXT,
DEPARTMENT TEXT,
EMAIL TEXT,
PHONE_NO Numeric,
JOINING_DATE DATE,
SALARY Numeric,
BONUS Numeric,
TAX_PERCENTAGE Numeric );

--2.2  Data Entry: Insert 10 sample employee records.

INSERT INTO employees (EMPLOYEE_ID,
NAME,DEPARTMENT,EMAIL,PHONE_NO,JOINING_DATE,SALARY,BONUS,TAX_PERCENTAGE) VALUES 
 (211,'Shankar','Manufacturing','Shankar@gmail.com',9176221122,'2025-04-25',45000,10000,6)
,(222,'Mukesh','Production','Mukesh@gmail.com',9176220413,'2025-05-26',46000,10000,6)
,(233,'Praveen','Sales','Praveen@gmail.com',9176220474,'2025-07-27',40000,10000,6)
,(244,'Shrinath','Manufacturing','Shrinath@gmail.com',9176110415,'2025-04-21',40000,10000,6)
,(255,'Vignesh','Sales','Vignesh@gmail.com',9176239116,'2025-04-22',45000,10000,6)
,(266,'Vimalrka','R & D','Vimalrka@gmail.com',9135674171,'2025-07-28',45000,10000,6)
,(277,'Kamaraj','Sales','Kamaraj@gmail.com',9176220418,'2025-05-31',49000,10000,6)
,(288,'Sekar','Design','Sekar@gmail.com',9176231418,'2025-03-18',51000,10000,6)
,(299,'Lokesh','Quality','Lokesh@gmail.com',9176276751,'2025-02-08',55000,10000,6)
,(311,'Joshua','R & D','Joshua@gmail.com',9176220498,'2025-05-30',43000,10000,6);

--2.3 a) Retrieve the list of employees sorted by salary in descending order.

Select e.name as Employee_name,e.salary
from employees e
order by salary desc;

--2.3 b) Find employees with a total compensation (SALARY + BONUS) greater than $100,000.

Select e.name as Employee_name,(e.SALARY + e.BONUS) as total_compensation
from employees e
where (e.SALARY + e.BONUS)> 100000
order by (e.SALARY + e.BONUS) desc;

--2.3 for updating the value in table

UPDATE employees SET bonus = bonus * 1.10
where department = 'Sales';

--2.3 for retriving the data by updating the value in table

select e.name as Employee_name, e.bonus * 1.10 as bonus
from employees e
where e.department = 'Sales'

--2.3 C)Calculate the net salary after deducting tax for all employees.

select e.name,salary,(e.salary * e.TAX_PERCENTAGE/100)as tax,
(e.salary - e.salary * e.TAX_PERCENTAGE/100) as net_salary 
from employees e
order by net_salary desc;

--2.3 D) Retrieve the average, minimum, and maximum salary per department

select department,avg(salary)as average_Salary
,max(salary) as maximum_salary
,min(salary) as minimum_Salary
from employees e
group by department;

--2.4 a) Retrieve employees who joined in the last 6 months.

SELECT *
FROM employees
WHERE joining_date >= (CURRENT_DATE - INTERVAL '6 month')

--2.4 b)Group employees by department and count how many employees each has.

select department,count(e.name) as Count_of_Employees
FROM employees e
group by department

--2.4 c)Find the department with the highest average salary.

select department, avg(salary) As average_salary
FROM employees e
group by department
order by average_salary desc
limit 1;

--2.4 d)Identify employees who have the same salary as at least one other employee
select e.name,e.employee_id,e.salary
FROM employees e
where salary in(
select salary
from employees e
group by salary
having count(salary) >1 )
order by salary desc;