
create table castomer (
customer_id int
,first_name varchar
,last_name varchar
,gender varchar
,dob date
,job_title varchar
,job_industry_category varchar
,wealth_segment varchar
,deceased_indicator varchar
,owns_car varchar
,address varchar
,postcode int
,state varchar
,country varchar
,property_valuation varchar
);

create table transaction (
transaction_id int
,product_id int
,customer_id int
,transaction_date date
,online_order varchar
,order_status varchar
,brand varchar
,product_line varchar
,product_class varchar
,product_size varchar
,list_price float
,standard_cost float
);
-- Задание 1
SELECT DISTINCT brand FROM transaction
WHERE standard_cost > 1500;
-- Задание 2
select * from transaction
where order_status = 'Approved'
and transaction_date between '2017-04-01' and '2017-04-09';
-- Задание 3
select distinct job_title from castomer
where job_industry_category in ('IT', 'Financial Services')
and job_title like 'Senior%';
-- Задание 4
select distinct t.brand
from transaction t
join castomer c on t.customer_id = c.customer_id
where c.job_industry_category = 'Financial Services';
-- Задание 5
select distinct on (c.customer_id) c.first_name, c.last_name
from castomer c
join transaction t on c.customer_id = t.customer_id
where t.online_order = 'True'
and t.brand in ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')
order by c.customer_id
limit 10;
-- Задание 6
select c.*
from castomer c
left join transaction t on c.customer_id = t.customer_id
where t.transaction_id is NULL;
-- Задание 7
select distinct c.customer_id, c.first_name, c.last_name
from castomer c
join transaction t on c.customer_id = t.customer_id
where c.job_industry_category = 'IT'
and t.standard_cost = (
    select MAX(standard_cost)
    from transaction
)
-- Задание 8
select distinct c.customer_id, c.first_name, c.last_name
from castomer c
join transaction t on c.customer_id = t.customer_id
where c.job_industry_category in ('IT', 'Health')
and t.order_status = 'Approved'
and t.transaction_date between '2017-07-07' and '2017-07-17';


