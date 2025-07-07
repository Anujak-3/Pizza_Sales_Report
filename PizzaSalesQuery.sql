/* total revenue*/
use pizza_db;

select sum(total_price) as "Total Revenue" from pizza_sales

/* all tables*/

select * from pizza_sales

/* Average order value */

select((sum(total_price))/ count (  distinct (order_id ) )) as " Average Order Value" 
from pizza_sales

select distinct (order_id ) from pizza_sales

/* total pizza sold*/

select sum(quantity) as "Total pizza sold" from pizza_sales

/* total orders*/

select count(distinct (order_id )) as "Total orders" from pizza_sales

/* Average Pizzas per order*/

select (sum(quantity)/count (  distinct (order_id ) )) as "Average Pizzas per Order" 
from pizza_sales

/* Daily trends for total orders*/

Select Datename(DW, order_date) as order_day , count(distinct order_id) as total_orders 
from pizza_sales 
group by Datename(DW, order_date) 

/* Monthly Trend for total orders*/

Select Datename(Month, order_date) as order_day , count(distinct order_id) as total_orders 
from pizza_sales 
group by Datename(month, order_date)

/* Percentage of Sales by Pizza Category*/

 select pizza_category, Round( sum(total_price*100) /(Select sum(total_price) from pizza_sales pizza_sales where month(order_date)=2  ),2) 
 as "percentage sales by category" 
 from pizza_sales where month(order_date)=2 
 group by pizza_category

/* percentage of sales by pizza category*/

 select pizza_size, Round( sum(total_price*100) /(Select sum(total_price) from pizza_sales pizza_sales ),2) 
 as "percentage sales by size" 
 from pizza_sales  
 group by pizza_size

 /*Total Pizza sold by pizza category*/

 select pizza_category, sum(quantity) as "Number of pizza sold" 
 from pizza_sales 
 group by pizza_category; 

/* top 5 Best Sellers by total pizza quantity */

select top 5 pizza_name, sum(quantity) as "Pizza Sold by top quantity" from pizza_sales 
group by pizza_name order by sum(quantity) desc 

/* Bottom 5 worst Sellers by quantity*/

select top 5 pizza_name, sum(quantity) as "Pizza Sold " from pizza_sales 
group by pizza_name order by sum(quantity) asc

/* Bottom 5 worst Sellers by total Pizza Sold*/

select top 5 pizza_name, sum(total_price) as "Pizza Sold" from pizza_sales 
group by pizza_name order by sum(quantity) asc

/*top 5 Best Sellers by Total Pizzas Sold*/
select top 5 pizza_name, sum(total_price) as "Pizza Sold" from pizza_sales 
group by pizza_name order by sum(quantity) desc 


select top 5 pizza_name, count(distinct order_id) as "Total orders" from pizza_sales 
group by pizza_name order by count(distinct order_id) desc 
