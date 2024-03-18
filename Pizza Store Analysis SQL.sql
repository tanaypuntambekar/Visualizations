select * from [Pizza DB]..pizza_sales

--
SELECT sum(total_price) as Total_Revenue
From [Pizza DB]..pizza_sales

--
select sum(total_price)/count(distinct order_id) as Avg_Order_Value
from [Pizza DB]..pizza_sales

--
select sum(quantity) as Total_Pizza_Sold
from [Pizza DB]..pizza_sales

--
select count(Distinct order_id) as Total_Orders
from [Pizza DB]..pizza_sales

--
select DATENAME(dw, order_date) as Order_Day,count(distinct order_id) as Total_Orders
from [Pizza DB]..pizza_sales
group by DATENAME(dw, order_date)

--
select DATENAME(MONTH, order_date) as Month_Name , count(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(MONTH, order_date) 
order by Total_orders desc

--
select pizza_category, sum(total_price)*100 / (select sum(total_price) from pizza_sales where MONTH(order_date) = 1) as Per_Total_Sales
from pizza_sales
where MONTH(order_date) = 1
group by pizza_category

--
select pizza_size,cast(sum(total_price) as decimal (10,2)) as Total_sales ,cast(sum(total_price)*100 / (select sum(total_price) from pizza_sales where DATEPART(QUARTER, order_date)= 1) as decimal (10,2)) as Per_Total_Sales
from pizza_sales
where DATEPART(QUARTER, order_date)=1	
group by pizza_size
order by Per_Total_Sales desc

--
select top 5 pizza_name , sum(total_price) as Total_Revenue_per_Pizza_best_selling
from pizza_sales
group by pizza_name 
order by Total_Revenue_per_Pizza_best_selling desc

--
select top 5 pizza_name , sum(total_price) as Total_Revenue_per_Pizza_worst_selling
from pizza_sales
group by pizza_name 
order by Total_Revenue_per_Pizza_worst_selling

--
select top 5 pizza_name , sum(quantity) as Total_Revenue_per_Pizza_quantity_top
from pizza_sales
group by pizza_name 
order by Total_Revenue_per_Pizza_quantity_top desc

--
select top 5 pizza_name , sum(quantity) as Total_Revenue_per_Pizza_quantity_bottom
from pizza_sales
group by pizza_name 
order by Total_Revenue_per_Pizza_quantity_bottom 

--
