CREATE DATABASE PRACTICE_DB;

USE PRACTICE_DB;

create table lifts
(
	id int,
	capacity_kg  int
);

INSERT INTO LIFTS
(id, capacity_kg)
values
(1, 300),
(2, 350);

create table lift_passengers
(
	passenger_name varchar(50),
    weight_kg  int,
	lift_id	int
);

insert into lift_passengers
(passenger_name, weight_kg, lift_id)
values
('Rahul', 85, 1),
('Adarsh', 73, 1),
('Riti', 95, 1),
('Dheeraj', 80, 1),
('Vimal', 83, 2),
('Neha', 77, 2),
('Priti', 73, 2),
('Himanshi', 85, 2);

##Question: The relationship betwwen lif and lif_passengers table is such that multiple passengers can attempt to enter the 
## same lift, but the total weight of the passengers in a lift cannot exceeds the total capacity of lift.

## Write a SQL query that produce a comma-separated list of passengers who can accomodated in each lift without exceeding 
## the lift's capacity. The passengers in the lift should be orderd by their weight in increasing order.

select * from lifts;
select * from lift_passengers;

with cte as
(
	select * ,
	sum(weight_kg) over(partition by id order by id, weight_kg) as cum_sum,
    case when sum(weight_kg) over(partition by id order by id, weight_kg) <= capacity_kg
    then 1 else 0
    end as flag
	from lifts l 
	inner join lift_passengers p on l.id = p.lift_id
	order by id, weight_kg
)
select id, string_agg(passenger_name, ',') as passesnger_list
from cte
where flag = 1
group by id ;






