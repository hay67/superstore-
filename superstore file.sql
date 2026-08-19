SELECT * FROM superstore.superstore;

USE superstore;
show COLUMNS FROM superstore;

SELECT `Order ID`, `Order Date`,sales,profit
from superstore
LIMIT 10;

Set SQL_SAFE_UPDATES = 0;
Alter table superstore
Add column clean_order_date DATE;
update superstore
SET clean_order_date = str_to_date(`order date`, '%m/%d/%y');

select`order date`, clean_order_date
from superstore
limit 20;
 
select `order date`
from superstore
where cast(substring_index(`order date`,'/',1) as unsigned) > 12
	or cast(substring_index(substring_index(`order date`,'/',2),'/',-1)as unsigned) >12
limit 10;

update superstore
set clean_order_date = str_to_date(`order date`,'%m/%d/%y');
select `order date`, clean_order_date
from superstore
limit 20;

update superstore
set clean_order_date = str_to_date(`order date`,'%m/%d/%Y');

select `order date`, clean_order_date 
from superstore
limit 10;

Alter Table superstore
Drop Column `order date`;
Alter Table superstore
change column clean_order_date `order date` DATE;

describe superstore; 

Set sql_safe_updates = 0;
Alter Table superstore
ADD column clean_ship_date DATE;
UPDATE superstore
SET clean_ship_date = str_to_date(`ship date`, '%m/%d/%Y');

Alter Table superstore
drop column `order date`,
drop column `ship date`;
 
 Alter Table superstore
change column clean_order_date `order date` DATE,
change column clean_ship_date `ship date` DATE;

Alter Table superstore
change column clean_ship_date `ship date` DATE;
SELECT `order ID`, `order date`, `ship date`, sales, profit
from superstore
limit 10;

Alter Table superstore
change column clean_ship_date `ship date` DATE;
UPDATE superstore
SET clean_ship_date = str_to_date(`ship date`, '%m/%d/%Y');
Alter Table superstore
drop column `ship date`;
Alter Table superstore
change column clean_ship_date `ship date` DATE;

SELECT `order ID`, `order date`, `ship date`, sales, profit
from superstore
limit 10;

Alter Table superstore
drop column clean_order_date;

SELECT
	Category,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit,
    round((sum(profit) / sum(sales)) * 100, 2 ) AS profit_margin_pct
from superstore 
group by category
order by total_profit DESC;

SELECT `ORDER ID`, `Product ID`, count(*) as copies
from superstore
GROUP BY `order ID`, `Product ID`
Having copies > 1;

SELECT *
From superstore
WHERE `order id` = 'CA-2016-129714'
   AND `product id` = 'OFF-PA-10001970';
   
CREATE TABLE superstore_clean AS
   select distinct * from superstore;
   
truncate TABLE superstore;
insert into superstore
select * from superstore_clean;
Drop table superstore_clean;

SELECT `ORDER ID`, `Product ID`, count(*) as copies
from superstore
GROUP BY `order ID`, `Product ID`
Having copies > 1;

select `ROW ID`, `Order ID` ,`product ID`,sales, profit
from superstore	
where `order id` = 'CA-2016-129714'
    AND `product id` = 'OFF-PA-10001970';
    
DELETE s1
FROM superstore s1
INNER join superstore s2
where s1.`order id` = s2. `order id`
	AND s1.`product id` = s2.`product id`
    AND S1.`ROW ID` > s2.`row id`;

SELECT `ORDER ID`, `Product ID`, count(*) as copies
from superstore
GROUP BY `order ID`, `Product ID`
Having copies > 1;

SELECT 
	COUNT(*) - COUNT(`Order ID`) AS missing_order_id,
    COUNT(*) - COUNT(`Order Date`) AS missing_order_date,
    COUNT(*) - COUNT(sales) AS missing_sales,
    COUNT(*) - COUNT(profit) AS missing_profit
FROM superstore;

SELECT `order ID`, `order Date`, `ship Date`
From superstore
WHERE `ship Date` < `order Date`;

SELECT
	Region,
    COUNT(DISTINCT `Order ID`) AS total_order,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit,
    round((sum(profit) / sum(sales)) * 100, 2 ) AS profit_margin_pct
from superstore 
group by Region
order by total_profit DESC;

SELECT
    Region,
    round(AVG(Discount) * 100, 2) AS avg_discount_pct,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore 
group by Region
order by total_profit DESC;

SELECT
	Category,
    round(sum(sales), 2) as central_sales,
    round(sum(profit), 2) as central_profit,
    round(avg(discount) * 100, 2) AS avg_discount_pct
from superstore
WHERE Region = 'central'
group by category
order by central_profit ASC;

SELECT
	`Customer name`,
    count(distinct `ORDER ID`) AS total_orders,
    round(sum(sales), 2) AS Total_sales,
    round(sum(profit), 2) AS Total_profit
from superstore
group by `customer Name`
Order by total_profit DESC
LIMIT 10;

SELECT
	`Customer name`,
    count(distinct `ORDER ID`) AS total_orders,
    round(sum(sales), 2) AS Total_sales,
    round(sum(profit), 2) AS Total_profit,
    round(AVG(Discount) * 100, 2) AS avg_discount_pct
from superstore
group by `customer Name`
having total_profit < 0
Order by total_profit ASC
LIMIT 10;

SELECT
	`ship mode`,
    count(distinct `order id`) AS total_orders,
    round(AVG(DATEDIFF(`ship date`, `order date`)),1) AS avg_delivery_days,
    round(sum(sales), 2) AS total_sales,
    round(sum(profit), 2) AS total_profit,
    round((sum(profit) / sum(sales)) * 100, 2) AS avg_delivery_pct
from superstore
group by `ship mode`
order by avg_delivery_days ASC;














































































