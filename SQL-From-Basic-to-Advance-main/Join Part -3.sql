select * from Employee;
select * from Dept;
select * from Manager;
select * from Project;
select * from Family;
-- Full Outer Join is also reffered as Full Join.
-- Full Join => Inner Join + all remaining records from Left table + all remaining records from Right table

select e.emp_id, e.emp_name, d.dept_id, d.dept_name
from Employee e
Full Join Dept d on d.dept_id = e. dept_id;

-- MySQL doesn't spport the Full Outer Join / Full Join. So for that do Union of both left join + right join.

select e.emp_name, e.salary, d.dept_name
from Employee e 
left join Dept d on e.dept_id=d.dept_id
union
select e.emp_name, e.salary, d.dept_name
from Employee e 
right join Dept d on e.dept_id=d.dept_id; 


-- Cross Join => Cross Join returns cartesian product. * Cross Join doesn't need the join condition.
-- Cross Join returs => Cross Join = No. of records in Left table x No. of records in Right table
select e.emp_name, e.salary, d.dept_name
from Employee e 
cross join Dept d;

-- Natural Join => SQl will decide on which column Join will happen.

select e.*, d.*
from Employee e 
natural join Dept d;


-- Self Join => When a table Join with itself.
-- Write a query to fetch the child name and their age corresponding to their parent name and parent age.

select child.name as Child_name,
child.age as Child_age,
parent.name as Parent_name,
parent.age as Parent_age
from Family as child
join Family as parent on child.parent_id = parent.member_id;


-- Employee salary greater than their manager salary

select 
emp.name as Employee
from Employee as emp
join Employee as mgr 
on mgr.id = emp.managerId where emp.salary > mgr.salary






