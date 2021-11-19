create table Comprobante(
    CodComprobante integer,
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
create table TipoComprobante(
    CodTipComprobante varchar(50),
    Descripcion varchar(50),
    primary key(CodTipComprobante)
);
create table ReportexComprobante(
    CodComprobante integer,
    CodReporteVentas integer,
    foreign key(CodComprobante) references Comprobante(CodComprobante),
    foreign key(CodReporteVentas) references ReporteVentas(CodReporteVentas)
);
create table ReporteVentas(
    CodReporteVentas integer,
    FechaReporte date,
    MontoTotal numeric(9,2),
    FechaInicio date,
    FechaFin date,
    TipoJoya varchar(50),
    primary key(CodReporteVentas)
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
create table cliente(
    DNI varchar(50),
    Nombre varchar(50),
    ApellidoPat varchar(50),
    ApellidoMat varchar(50),
    FechaNacim date,
    primary key(DNI)
);