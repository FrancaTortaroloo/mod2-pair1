USE nothwind;

SELECT
employee_id, 
last_name,
first_name
FROM northwind.employees;

-- Productos mas baratos

SELECT
product_name
FROM northwind.products
WHERE unit_price BETWEEN 0 AND 5;

-- CONOCIENDO los productos que no tienen precio

SELECT product_id
FROM northwind.products
WHERE unit_price IS NULL;

-- comparando productos

SELECT 
product_id
FROM northwind.products
WHERE product_id < 10
AND unit_price < 15;

-- cambiando operadores

SELECT
product_id
FROM northwind.products
WHERE product_id > 10 
AND unit_price > 15; 

-- conociendo los paises a los que vendemos
SELECT DISTINCT
ship_country
FROM orders;

-- conociendo los tipos de productos

SELECT product_name,
unit_price,
product_id
FROM products
LIMIT 10;

-- ordenando resultados

SELECT product_name,
unit_price,
product_id
FROM products
ORDER BY product_id DESC
LIMIT 10;

-- pedidos en la bbdd.  ERROR

SELECT DISTINCT
order_id
FROM order_details;

-- Que pedidos han gastado más

SELECT
unit_price,
quantity,
unit_price * quantity AS importe_total
FROM order_details
ORDER BY importe_total DESC
LIMIT 3;

-- pedidos que están entre las posiciones 5 y 10

SELECT 
order_id,
unit_price,
quantity,
unit_price * quantity AS importe_total
FROM order_details
ORDER BY importe_total DESC
LIMIT 5
OFFSET 5;

-- que categorias hay en la bbdd

SELECT 
category_name as nombre_de_categoria
FROM categories;

-- envios con retrasos

SELECT
shipped_date,
DATE_ADD(shipped_date, INTERVAL 5 DAY) AS fecha_retrasada
FROM orders;

/* productos mas rentables. mayor o igual a 15 dólares, pero menor o igual que 50 dólares. 
 Selecciona los datos de ese rango de productos usando el operador BETWEEN. 
*/

SELECT product_name, unit_price
FROM northwind.products
WHERE unit_price BETWEEN 15 and 50;

/* productos con unos precios dados
precio de 18, 19 o 20 dólares. Usa IN para conseguirlo de manera eficiente.
*/

SELECT product_name, unit_price
FROM northwind.products
WHERE unit_price IN (18,19,20);


