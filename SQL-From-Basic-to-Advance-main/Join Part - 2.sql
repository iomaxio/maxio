use practice_database;
select * from Employee;
select * from Dept;
select * from Manager;
select * from Project;
-- Fetch the employee name & department name they belong to.

-- Inner Join / Join => Fetches only matching records in both tables based on the JOIN condition.

select e.emp_name, e.salary, d.dept_name
from Employee e 
join Dept d on e.dept_id=d.dept_id; 

-- Fetch ALL the employee name and their department name they belong to.
-- Left Join / Left Outer Join = inner join + any additional records in the left table.
select e.emp_name, e.salary, d.dept_name
from Employee e 
left join Dept d on e.dept_id=d.dept_id; 

-- Right Join / Right Outer Join = inner join + any addition records from the right table.

select e.emp_name, e.salary, d.dept_name
from Employee e 
Right join Dept d on e.dept_id=d.dept_id;

-- Fetch details of All emp, their manager, their manager, their department and the projects they work on.

select e.emp_name, e.salary, d.dept_name, m. manager_name, p.project_name
from Employee e 
left join Dept d on e.dept_id = d.dept_id
inner join Manager m on e.manager_id = m.manager_id
left join Project p on p.team_member_id = e.emp_id

