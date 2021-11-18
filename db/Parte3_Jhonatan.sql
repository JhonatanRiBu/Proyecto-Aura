create table comprobante(
    CodComprobante integer,
    FechaFacturacion date,
    MontoTotal numeric(9,2),
    CodPedido integer,
    CodTipComprobante varchar(50),   
    CodParty integer,
    SubMontoTotal numeric(9,2),
    IGV numeric(9,2),
    FechaVencimiento date,
);
create table TipoComprobante(
    CodTipComprobante varchar(50),
    Descripcion varchar(50)
);
create table ReportexComprobante(
    CodComprobante integer,
    CodReporteVentas integer,
);
create table ReporteVentas(
    CodReporteVentas integer,
    FechaReporte date,
    MontoTotal numeric(9,2),
    FechaInicio date,
    FechaFin date,
    TipoJoya varchar(50)
);
create table ItemComprobante(
    CodProducto varchar(50),
    CodComprobante integer,
    Cantidad Integer
);
create table StockProducto(
    CodProducto varchar(50),
    Stock Integer
);