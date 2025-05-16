CREATE DATABASE Mass;
GO

USE Mass;
GO


-- Tabla de clientes (con DNI en lugar de teléfono)
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    dni VARCHAR(15) UNIQUE NOT NULL
);

-- Tabla de productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    precio_unitario DECIMAL(10,2),
    stock INT
);

-- Tabla de ventas
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY IDENTITY(1,1),
    id_cliente INT,
    fecha_venta DATE DEFAULT GETDATE(),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabla detalle de ventas
CREATE TABLE detalle_ventas (
    id_detalle INT PRIMARY KEY IDENTITY(1,1),
    id_venta INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);



INSERT INTO clientes (nombre, dni)
VALUES 
('Carlos Mendez', '12345678'),
('Lucía Gutierrez', '87654321');


INSERT INTO productos (nombre, precio_unitario, stock)
VALUES 
('Arroz 1kg', 04.30, 100),
('Frijol 1kg', 05.00, 80),
('Azúcar 1kg', 04.00, 60),
('Aceite 1L', 10.00, 50),
('Sal 1kg', 06.00, 40),
('Detergente 1kg', 08.00, 30),
('Papel Higiénico 4 rollos', 09.00, 70);


-- Insertar venta
INSERT INTO ventas (id_cliente)
VALUES (1); -- Carlos

-- Obtener el ID de la venta recién creada
DECLARE @id_venta INT = SCOPE_IDENTITY();

-- Insertar detalle de venta
INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario)
VALUES
(@id_venta, 1, 2, 04.30),  -- Arroz
(@id_venta, 4, 1, 10.00);  -- Aceite


SELECT 
    v.id_venta,
    v.fecha_venta,
    c.nombre AS cliente,
    c.dni,
    p.nombre AS producto,
    dv.cantidad,
    dv.precio_unitario,
    (dv.cantidad * dv.precio_unitario) AS total
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN detalle_ventas dv ON v.id_venta = dv.id_venta
JOIN productos p ON dv.id_producto = p.id_producto
ORDER BY v.fecha_venta DESC;


SELECT *
FROM ventas
WHERE fecha_venta < '2025-05-01';


