create table TipoComprobante(
    CodTipComprobante varchar(50),
    Descripcion varchar(50),
    primary key(CodTipComprobante)
);
create table ReporteVentas(
    CodReporteVentas integer AUTO_INCREMENT,
    FechaReporte date,
    MontoTotal numeric(9,2),
    FechaInicio date,
    FechaFin date,
    primary key(CodReporteVentas)
);
create table Comprobante(
    CodComprobante integer AUTO_INCREMENT,
    FechaFacturacion date,
    MontoTotal numeric(9,2),
    CodPedido integer,
    CodTipComprobante varchar(50),   
    CodParty integer,
    SubMontoTotal numeric(9,2),
    IGV numeric(9,2),
    FechaVencimiento date,
    primary key(CodComprobante),
    foreign key(CodPedido) references Pedido(CodPedido),
    foreign key(CodTipComprobante) references TipoComprobante(CodTipComprobante),
    foreign key(CodParty) references Party(CodParty)
);
create table ReportexComprobante(
    CodComprobante integer,
    CodReporteVentas integer,
    foreign key(CodComprobante) references Comprobante(CodComprobante),
    foreign key(CodReporteVentas) references ReporteVentas(CodReporteVentas)
);
create table ItemComprobante(
    CodProducto varchar(50),
    CodComprobante integer,
    Cantidad Integer,
    foreign key(CodProducto) references Producto(CodProducto),
    foreign key(CodComprobante) references Comprobante(CodComprobante)
);
create table StockProducto(
    CodProducto varchar(50),
    Stock Integer,
    foreign key(CodProducto) references Producto(CodProducto),
);
create table Cliente(
    DNI varchar(50),
    Nombre varchar(50),
    ApellidoPat varchar(50),
    ApellidoMat varchar(50),
    FechaNacim date,
    CodParty integer,
    primary key(CodParty, DNI), 
    foreign key(CodParty, DNI) references Party(CodParty, DNI)  
);

insert into TipoComprobante(CodTipComprobante,Descripcion) values ('C1','Factura');
insert into TipoComprobante(CodTipComprobante,Descripcion) values ('C2','Boleta');

insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('2021-11-20',820.00,'2021-11-10','2021-11-19');


insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2021-11-19',150.00,1,'C1',1,114.8,25.2,'2019-11-26');
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2021-11-18',200.00,2,'C2',2,164,36,NULL);
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2021-11-17',376.00,3,'C2',3,308.32,67.68,NULL);
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2021-11-16',110.00,4,'C2',4,90.2,19.8,NULL);
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2021-11-15',86.00,5,'C1',5,70.52,15.48,'2019-11-22');
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2021-11-14',300.00,6,'C1',6,246,54,'2019-11-21');
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2021-11-13',1400.00,7,'C2',7,1148,252,NULL);
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2021-11-12',250.00,8,'C1',8,205,45,'2019-11-19');
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2021-11-11',175.00,9,'C1',9,143.5,31.5,'2019-11-18');
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2021-11-10',200.00,10,'C2',10,164,36,NULL);

insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (1,1);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (2,1);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (3,1);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (4,1);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (5,1);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (6,1);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (7,1);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (8,1);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (9,1);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (10,1);

insert into ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('SO201925',1,1);
insert into ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('SO201925',2,1);
insert into ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('DI202014',2,1);
insert into ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('PU201889',3,1);
insert into ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('ARE201965',4,1);
insert into ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('GE202156',5,1);
insert into ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('CO201901',6,1);
insert into ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('AR201743',7,1);
insert into ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('SO201925',8,1);
insert into ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('SO201925',9,1);
INSERT INTO ItemComprobante(CodProducto,CodComprobante,Cantidad) values ('SO201925',10,1);

insert into StockProducto(CodProducto,Stock) values ('SO201925',9);
insert into StockProducto(CodProducto,Stock) values ('DI202014',4);
insert into StockProducto(CodProducto,Stock) values ('PU201889',2);
insert into StockProducto(CodProducto,Stock) values ('ARE201965',5);
insert into StockProducto(CodProducto,Stock) values ('GE202156',8);
insert into StockProducto(CodProducto,Stock) values ('CO201901',6);
insert into StockProducto(CodProducto,Stock) values ('AR201743',5);
insert into StockProducto(CodProducto,Stock) values ('DI202078',6);
insert into StockProducto(CodProducto,Stock) values ('ARE202161',7);
insert into StockProducto(CodProducto,Stock) values ('CO201910',3);

insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim, CodParty) values ('70503215','Gustavo Jesús','Alvino','Gomez','1993-04-12', 3);
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('70154312','Josep Elian','Artica','Gonzales','1997-06-12');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('50341231','Alvaro Luis','Aviles','Aguado','1988-04-12');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('26242032','Carlos','Caballero','Tokudome','1990-01-12');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('23029322','Lucas','Cahuana','Arroyo','1992-06-12');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('35040230','Hugo','Concepción','Vallejo','2000-02-12');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('32992392','Paola','Espiritu','Cordova','1995-08-12');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('42020022','Milagros','Garcia','Chavez','2001-12-12');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('24204200','Christofer','Gonzales','Casimiro','1996-09-12');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('70340034','Darline','Huaman','Huerta','1982-07-12');