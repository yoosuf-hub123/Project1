use project1;select * from sales

-- 1) identify the top 5 best selling products
select product as `top 5 best selling products` from sales order by quantity desc,`Sales Amount` desc limit 5;

-- 2) sales by region
select region,round(sum(`Sales Amount`),0) as `Total Sales` from sales group by region

-- 3) sales by category
select Category,round(sum(`Sales Amount`),0) as `Total Sales` from sales group by Category

-- 4) profit margins
select * ,  concat(round(((`Exact Profit`)/(`Sales Amount`))*100,0),'%') as `Profit Margin` from sales

-- 5) Identify the top 3 most profitable products based on total profit.
select product as `top 3 most profitable products`  from sales order by `Profit Rounded` desc limit 3

-- 6) Find the total sales and total profit by each Sales Representative.
select `Sales Rep`,round(sum(`Sales Amount`),0) as `Total Sales`,round(sum(`Exact Profit`),0) as `Total Profit` from sales group by `Sales Rep`

--  7) Calculate the total purchase amount for each customer and sort by highest purchase.
select `Customer Name`,concat("₹",sum(`Sales Amount`)) as `total purchase amount`  from sales group by `Customer Name` order by  sum(`Sales Amount`) desc

--  8) Determine the total discount given for each product category.  -- select * from sales
select category, concat("₹ ",round(sum(Discount),2)) as `Total Discount` from sales group by category

--  9) Find the top 3 highest revenue-generating sales representatives.
SELECT `Sales Rep` as `top 3 highest revenue-generating sales representatives`,sum(`Sales Amount`) as `Total Revenue` from sales group  by `Sales Rep` order by sum(`Sales Amount`) desc limit 3

-- 10)Identify the region with the highest total discount given.
select Region as `region with the highest total discount` ,round(sum(Discount),0) as `Total Discount` from sales group by region order by sum(Discount) desc limit 1 

-- 11)Find the average sales amount per category. -- select * from sales
select category,round(avg(`Sales Amount`),0) as`average sales amount` from sales group by category 

-- 12)Determine the top 5 customers who have made the highest purchases.
select `Customer Name` as `top 5 customers who have made the highest purchases`,sum(Quantity) as `Purchase Quantity` from sales group by `Customer Name` order by `Purchase Quantity` desc,`Customer Name` asc limit 5

-- 13) Calculate the total profit for each month in 2024. -- select * from sales
select `Ordered Month` as `month in 2024`,concat("₹ ",round(sum(`Exact Profit`),0)) as `Total Profit` from sales where `Ordered Year`=2024 group by `Ordered Month` order by `Ordered Month`

-- 14)Find the total number of orders placed in each month.(all years)
select `Ordered Month` as `Month(2024)`,count(`Order ID`) as `total number of orders` from sales where `Ordered Year`=2024 group by `Ordered Month` order by `Ordered Month`;
select `Ordered Month` as `Month(2025)`,count(`Order ID`) as `total number of orders` from sales where `Ordered Year`=2025 group by `Ordered Month` order by `Ordered Month`;

-- 15)  Identify the least sold product based on quantity.
select product as `least sold product`,sum(quantity) as `Total Quantity` from sales group by Product order by sum(quantity) asc limit 1

-- 16) Calculate the total sales and total profit for each sales representative.-- select * from sales
select `Sales Rep`,concat("₹ ",round(sum(`Sales Amount`),0)) as `Total Sales` ,concat("₹ ",round(sum(`Exact Profit`),0)) as `Total Profit`  from sales group by `Sales Rep` order by sum(`Exact Profit`) desc;

-- 17)  Find the top 3 regions contributing the most to total sales.-- select * from sales
select region as `top 3 regions contributing the most to total sales`,concat("₹ ",round(sum(`Sales Amount`),0)) as `Total Sales` from sales group by region order by sum(`Sales Amount`) desc limit 3

-- 18)  Identify customers who have received the highest total discount.
select `Customer Name` as `customers who have received the highest total discount`,concat("₹ ",sum(Discount)) as`Total Discount` from sales group by `Customer Name` order by sum(Discount) desc limit 20

-- 19)  Determine the best-selling category based on total quantity sold.
select Category as `best-selling category` , sum(Quantity) as `total quantity sold` from sales group by Category order by `total quantity sold` desc limit 1

-- 20)  Calculate the percentage contribution of each product to the total sales.
select product,concat(round(((sum(`Sales Amount`))/(select sum(`Sales Amount`) from sales))*100,2),"%") as ` percentage contribution to the total sales` from sales group by product order by round(((sum(`Sales Amount`))/(select sum(`Sales Amount`) from sales))*100,2) desc



