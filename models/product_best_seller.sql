{{ config(materialized='table') }}

with source_data as (
    select p.id, p.name, sum(oi.quantity) as q_sold from ops.product p 
	join ops.order_item oi on oi.product_id = p.id 
	group by p.id
	order by q_sold desc
)

select * from source_data