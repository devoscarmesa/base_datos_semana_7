-- consulta para unir las dos tablas de bodegas
SELECT b1.IDBodega, b1.nombreArticulo, b1.fechaAlmacenamiento, b1.cantidad, 'B1' AS bodega FROM bodega_1 AS b1
UNION 
SELECT b2.IDBodega, b2.nombreArticulo, b2.fechaAlmacenamiento, b2.cantidad, 'B2' AS bodega FROM bodega_1 AS b2;

-- Encontrar filas usando una igualdad simple 
SELECT 
    numeroCliente, 
    nombreCliente, 
    contactoApellido, 
    ciudad 
FROM 
    cliente
WHERE 
    estado = 'CA';

-- Encontrar filas que cumplan dos condiciones 
SELECT 
    numeroCliente, 
    nombreCliente, 
    contactoApellido,
    limiteDeCredito
FROM 
    cliente
WHERE 
    ciudad = 'San Francisco' AND numeroEmpleadoVentas = 1165;

-- Encontrar filas con el valor entre dos valores 
SELECT 
    numeroCliente, 
    nombreCliente, 
    contactoApellido,
    ciudad,
    estado
FROM 
    cliente
WHERE 
    limiteDeCredito > 100000 AND limiteDeCredito < 300000;

-- Encontrar tuplas que cumplan con cualquiera de las dos condiciones
SELECT 
    numeroCliente, 
    nombreCliente, 
    contactoApellido,
    limiteDeCredito
FROM 
    cliente
WHERE 
    ciudad = 'San Francisco' OR numeroEmpleadoVentas = 1165;

-- Encontrar filas que tengan un valor en una lista de valores
SELECT 
    numeroCliente, 
    nombreCliente, 
    contactoApellido,
    limiteDeCredito,
    estado
FROM 
    cliente
WHERE 
    pais IN ('USA', 'Poland', 'Germany', 'France');

-- Encontrar filas cuyos valores contienen una cadena
SELECT 
    numeroCliente, 
    nombreCliente, 
    contactoApellido,
    limiteDeCredito,
    estado
FROM 
    cliente
WHERE 
    nombreCliente LIKE '%Gifts%';


-- Ordenar la tabla de clientes por el límite de crédito, de modo ascendente.

SELECT 
    *
FROM 
    cliente
ORDER BY limiteDeCredito;

--  Ordenar la tabla de clientes por el límite de crédito, de modo descendente.

SELECT 
    *
FROM 
    cliente
ORDER BY limiteDeCredito DESC;

-- Ordenar la tabla de pedido por número de orden decentemente y luego por fecha limite de entrega ascendentemente.

SELECT 
    *
FROM 
    pedido
ORDER BY numOrden DESC, fechaLimitEntrega ASC;


-- Agrupar los pedidos en subgrupos por el estado

SELECT 
    * 
FROM 
    pedido 
GROUP BY 
    estado;

-- Uso de función AVG para calcular el precio de compra promedio de productos para cada línea de productos

SELECT 
	lineaProducto, 
    AVG(precioDeCompra) AS 'Precio promedio' 
FROM 
	producto
GROUP BY 
	lineaProducto;

-- Uso de la función COUNT que devuelve el número de productos en cada línea de producto

SELECT 
	lineaProducto, 
    COUNT(*) AS 'numero de Productos' 
FROM 
	producto
GROUP BY 
	lineaProducto;

-- Uso de la funcion SUM que calcula el monto total de cada pedido

SELECT
	numOrden,
    SUM(cantidadOrden * precio) AS 'totalOrden'
FROM 
	detalle_pedido
GROUP BY
	numOrden;

-- Uso de una función MIN para obtener el producto con el precio de compra más bajo para cada línea de producto

SELECT 
	lineaProducto,
    MIN(precioDeCompra)
FROM 
	producto
GROUP BY
	lineaProducto;

-- Uso de la función MAX para obtener el pago mas grande de cada cliente

SELECT 
	numeroCliente,
    MAX(cantidad) AS 'pago_mas_grande_cliente'
FROM 
    pagos
GROUP BY 
	numeroCliente;

-- Uso de HAVING para obtener los números de pedido, el número de artículos vendidos por pedido y las ventas totales de cada uno presentes en la tabla detalle_pedido

SELECT
	numOrden,
    SUM(cantidadOrden) AS 'cantidadItem',
    SUM(cantidadOrden * precio) AS 'total'
FROM 
	detalle_pedido
GROUP BY 
	numOrden
HAVING
	total > 10000;