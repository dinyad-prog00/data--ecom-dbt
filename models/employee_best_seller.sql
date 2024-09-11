{{ config(materialized='table') }}

with source_data as (
    select e.id, e.first_name, sum(oi.quantity) as q_sold from ops.order o
	join ops.order_item oi on oi.order_id = o.id 
    join ops.employee e on o.employee_id = e.id 
	group by e.id
	order by q_sold desc
)

select * from source_data