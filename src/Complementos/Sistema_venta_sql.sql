Create database SistemaVentas
go
use SistemaVentas
go

Create table Productos(
	Id_Product INT Primary Key Identity(1,1),
	product_nombre varchar(100) ,
	product_descripcion varchar(255),
	product_precio Float,
	product_Stock int,
	product_tipo varchar(50)
)


Create table H_Ventas(
		Id_Venta INT Primary Key Identity(1,1),
		iproducto int,
		nombreproduct varchar(100),
		tipoproduct varchar(255),
		precio Float,
		NombreUsuario varchar(100),
		tarjetaUsuario int
)

Create table Usuario(
	Usuario_id INT Primary Key Identity(1,1),
	Usuario_Nombre varchar(100),
	Usuario_tarjeta int
)



Create table Reportes(
	Reporte_id INT Primary Key Identity(1,1),
	Reporte_fechaDeEjecucion DateTime,--Formato de datetime (YYYY-MM-DD HH:MM:mm)--> ejemplo: '2025-05-13 14:30:00'
	Reporte_TipoDeOperacion varchar(500),--Solo hay 2 tipos de Operacion: 'Edicion' y 'Venta' 
	Reporte_NombreEmpleado varchar(100)
)
