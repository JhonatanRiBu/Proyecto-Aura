create table comprobante(
    CodComprobante varchar(20),
    FechaFacturacion date,
    MontoTotal numeric(9,2),
    CodPedido varchar(50),
    CodTipoComprobante varchar(50),   
    CodParty varchar(50),
    SubMontoTotal numeric(9,2),
    IGV numeric(9,2),
    FechaVencimiento date,
);
create table TipoComprobante(
    CodTipoComprobante varchar(50),
    Descripcion varchar(50)
);
create table ReportexComprobante(
    CodComprobante varchar(50),
    CodReporteVentas varchar(50),
);
create table ReporteVentas(
    CodReporteVentas varchar(50),
    FechaReporte date,
    MontoTotal numeric(9,2),
    CodMoneda varchar(50),
    FechaInicio date,
    FechaFin date,
    TipoJoya varchar(50)
);
create table ItemComprobante(
    CodProducto varchar(50),
    CodComprobante varchar(50),
    Cantidad Integer
);
create table StockProducto(
    CodProducto varchar(50),
    Stock Integer
);