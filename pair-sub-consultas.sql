use northwind;

/* 1- Extraed los pedidos con el máximo "order_date" para cada empleado.

Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. 
Para eso nos pide que lo hagamos con una query correlacionada. */

SELECT order_id,
customer_id,
employee_id,
order_date,
required_date
FROM orders
WHERE(SELECT max(order_date)
FROM orders
);

/* 2-  Extraed el precio unitario máximo (unit_price) de cada producto vendido.

Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. 
De nuevo lo tendréis que hacer con queries correlacionadas.*/


/* 3- Extraed información de los productos "Beverages"

En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages". 
Devuelve el ID del producto, el nombre del producto y su ID de categoría.*/


SELECT 
product_id,
product_name,
category_id
FROM products
WHERE category_id IN (
SELECT category_id
FROM categories
WHERE category_name = 'Beverages'
);


/* 4- Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país

Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores 
adicionales.*/

SELECT DISTINCT country
FROM customers
WHERE country NOT IN (
SELECT DISTINCT country
FROM suppliers
);



/* 5- Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"

Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" 
(ProductID 6) en un solo pedido. */

SELECT orders.order_id,
orders.customer_id
FROM orders
JOIN order_details
ON  orders.order_id = order_details.order_id
WHERE (
product_id = 6 AND
quantity > 20
);


/* 6- Extraed los 10 productos más caros

Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros. */



/* 7- Qué producto es más popular

Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró. */ 


SELECT product_name, MAX(quantity) AS max_quantity
FROM (
    SELECT products.product_name, SUM(order_details.quantity) AS quantity
    FROM products
    JOIN order_details ON products.product_id = order_details.product_id
    GROUP BY products.product_name
) AS popular_products;


SELECT product_name, SUM(quantity) AS max_quantity
FROM (
    SELECT products.product_name, MAX(order_details.quantity) AS quantity
    FROM products
    JOIN order_details ON products.product_id = order_details.product_id
    GROUP BY products.product_name
) AS popular_products
ORDER BY product_name ASC;



