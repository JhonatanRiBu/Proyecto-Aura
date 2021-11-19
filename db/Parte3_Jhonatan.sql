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
    primary key(DNI)  
);

insert into TipoComprobante(CodTipComprobante,Descripcion) values ('C1','Factura');
insert into TipoComprobante(CodTipComprobante,Descripcion) values ('C2','Boleta');

insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('7 Abr 2019',820.00,'2 Mar 2019','31 Mar 2019');
insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('7 May 2019',670.00,'2 Abr 2019','30 Abr 2019');
insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('7 Jun 2019',620.00,'2 May 2019','31 May 2019');
insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('1 Jul 2019',620.00,'2 Jun 2019','30 Jun 2019');
insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('1 Ago 2019',710.00,'2 Jul 2019','31 Jul 2019');
insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('1 Set 2019',840.00,'2 Ago 2019','31 Ago 2019');
insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('1 Oct 2019',920.00,'2 Set 2019','30 Set 2019');
insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('1 Nov 2019',1020.00,'2 Oct 2019','31 Oct 2019');
insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('1 Dic 2019',980.00,'2 Nov 2019','30 Nov 2019');
insert into ReporteVentas(FechaReporte,MontoTotal,FechaInicio,FechaFin,TipoJoya) values ('1 Ene 2019',750.00,'2 Dic 2019','31 Dic 2019');

insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('2 Mar 2019',140.00,1,'C1',1,114.8,25.2,'9 Mar 2019');
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('5 Jun 2020',200.00,2,'C2',2,164,36,NULL);
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('12 May 2020',376.00,3,'C2',3,308.32,67.68,NULL);
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('11 Set 2021',110.00,4,'C2',4,90.2,19.8,NULL);
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('25 Ene 2019',86.00,5,'C1',5,70.52,15.48,'1 Feb 2019');
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('23 Feb 2020',300.00,6,'C1',6,246,54,'1 Abr 2020');
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('1 Nov 2018',1400.00,7,'C2',7,1148,252,NULL);
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('14 Nov 2019',250.00,8,'C1',8,205,45,'21 Nov 2019');
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('13 Dic 2018',175.00,9,'C1',9,143.5,31.5,'20 Dic 2018');
insert into Comprobante(FechaFacturacion,MontoTotal,CodPedido,CodTipComprobante,CodParty,SubMontoTotal,IGV,FechaVencimiento) values ('7 Abr 2021',200.00,10,'C2',10,164,36,NULL);

insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (1,2);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (1,4);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (2,5);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (3,3);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (3,4);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (4,1);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (4,2);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (5,3);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (5,4);
insert into ReportexComprobante(CodComprobante,CodReporteVentas) values (6,1);

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


insert into StockProducto(CodProducto,Stock) values ('P1',9);
insert into StockProducto(CodProducto,Stock) values ('P2',4);
insert into StockProducto(CodProducto,Stock) values ('P3',8);
insert into StockProducto(CodProducto,Stock) values ('P4',2);
insert into StockProducto(CodProducto,Stock) values ('P5',5);
insert into StockProducto(CodProducto,Stock) values ('P6',8);
insert into StockProducto(CodProducto,Stock) values ('P7',6);
insert into StockProducto(CodProducto,Stock) values ('P8',5);
insert into StockProducto(CodProducto,Stock) values ('P9',5);
insert into StockProducto(CodProducto,Stock) values ('P10',3);

insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('70503215','Gustavo Jesús','Alvino','Gomez','12 Abr 1993');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('70154312','Josep Elian','Artica','Gonzales','12 Jun 1997');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('50341231','Alvaro Luis','Aviles','Aguado','12 Abr 1988');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('26242032','Carlos','Caballero','Tokudome','12 Ene 1990');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('23029322','Lucas','Cahuana','Arroyo','12 Jun 1992');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('35040230','Hugo','Concepción','Vallejo','12 Feb 2000');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('32992392','Paola','Espiritu','Cordova','12 Ago 1995');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('42020022','Milagros','Garcia','Chavez','12 Dic 2001');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('24204200','Christofer ','Gonzales','Casimiro','12 Set 1996');
insert into Cliente(DNI,Nombre,ApellidoPat,ApellidoMat,FechaNacim) values ('70340034','Darline','Huaman','Huerta','12 Jul 1982');