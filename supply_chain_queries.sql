SELECT count(*) as total_orders from orders;

SELECT DISTINCT carrier as unique_carrier from orders;

SELECT order_id, product_id, ship_late_day_count from orders
where ship_late_day_count >5;

SELECT customer, COUNT(order_id) AS total_orders
FROM orders GROUP BY customer 
ORDER BY total_orders DESC LIMIT 5;

SELECT plant_code, sum(unit_quantity) as total_quantity,
avg(weight) as average_weight from orders 
group by plant_code;

SELECT carrier, sum(weight) as total_weight from orders
group by carrier;

SELECT distinct o.Plant_code, p.Product_ID from orders o JOIN
productpercost p ON o.Product_ID = p.Product_ID AND o.plant_code = p.plant_code;

SELECT plant_id, sum(unit_quantity) as quantity, sum(daily_capacity) as daily_capacity
from orders o join whcapacities w ON o.plant_code = w.plant_id
group by plant_id
order by plant_id desc;

SELECT plant_code, SUM(unit_quantity) AS total_units 
FROM orders GROUP BY plant_code 
ORDER BY total_units DESC LIMIT 1;

SELECT o.plant_code, SUM(o.weight) AS total_weight, w.daily_capacity 
FROM orders o JOIN whcapacities w ON o.plant_code = w.plant_id
GROUP BY o.plant_code, w.daily_capacity 
HAVING SUM(o.weight) > 0.9 * w.daily_capacity;

SELECT o.plant_code, SUM(o.unit_quantity * c.cost_per_unit) AS total_estimated_cost 
FROM orders o JOIN whcosts c ON o.plant_code = c.wh GROUP BY o.plant_code;

SELECT distinct customer, carrier, sum(weight) as shipping_weight
from orders 
group by customer, carrier
order by shipping_weight desc
limit 3;

SELECT plant_code, SUM(unit_quantity) AS total_units,
RANK() OVER (ORDER BY SUM(unit_quantity) DESC) AS plant_rank
FROM orders
GROUP BY plant_code;

SELECT 
  order_date,
  SUM(unit_quantity) OVER (ORDER BY order_date) AS running_total
FROM orders;



