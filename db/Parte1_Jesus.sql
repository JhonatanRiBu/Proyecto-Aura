create table Pedido(
    CodPedido integer AUTO_INCREMENT,
    Comentario varchar(100),
    FechaCreacion date,
    CodParty integer,
    primary key(CodPedido),
    foreign key(CodParty) references Party(CodParty)
);

create table ArticuloPedido(
    CodPedido integer,
    CodProducto varchar(50),
    Cantidad integer
    foreign key(CodPedido) references Pedido(CodPedido),
    foreign key (CodProducto) references Producto(CodProducto)
);

create table Producto(
    CodProducto varchar(50),
    NomProducto varchar(60),
    FechaIntroduccion date,
    Descripcion varchar(200),
    CodCateg varchar(50),
    Precio numeric(9,2),
    CodPureza varchar(50),
    primary key(CodProducto),
    foreign key(CodCateg) references CategoriaProducto(CodCateg),
    foreign key(CodPureza) references Pureza(CodPureza)
);

create table CategoriaProducto(
    CodCateg varchar(50),
    Descripcion varchar(50),
    primary key(CodCateg)
);

create table Pureza(
    CodPureza varchar(50),
    Pureza varchar(50),
    primary key(CodPureza)
);

create table ItemCotizacion(
    CodItemCotiz integer AUTO_INCREMENT,
    Cantidad integer,
    PrecioUnitarioCotiz numeric(9,2),
    Especificacion varchar(100),
    CodCotizacion integer,
    CodCateg varchar(50),
    CodPureza varchar(50),
    primary key(CodItemCotiz),
    foreign key(CodCotizacion) references Cotizacion(CodCotizacion),
    foreign key(CodCateg) references CategoriaProducto(CodCateg),
    foreign key(CodPureza) references Pureza(CodPureza)
);

create table Cotizacion(
    CodCotizacion integer AUTO_INCREMENT,
    ValorPrecio numeric(9,2),
    Estado varchar(50),
    PlazoEntrega date,
    CodParty integer,
    FechaCreacion date,
    primary key(CodCotizacion),
    foreign key(CodParty) references Party(CodParty)
);

INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '19 Nov 2021', 4);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '18 Nov 2021', 3);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '17 Nov 2021', 6);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '16 Nov 2021', 7);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '15 Nov 2021', 5);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '14 Nov 2021', 4);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '13 Nov 2021', 3);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '12 Nov 2021', 5);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '11 Nov 2021', 6);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '10 Nov 2021', 7);

INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(1, 'SO201925', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(2, 'SO201925', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(2, 'DI202014', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(3, 'PU201889', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(4, 'ARE201965', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(5, 'GE202156', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(6, 'CO201901', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(7, 'AR201743', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(8, 'SO201925', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(9, 'SO201925', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(10, 'SO201925', 1);

INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('SO201925', 'Sortija de compromiso', '14 Mar 2019', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'SO', '60.00', 'LP2');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('DI202014', 'Sortija de compromiso', '24 Abr 2020', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'DI', '60.00', '18K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('PU201889', 'Sortija de compromiso', '19 Mar 2018', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'PU', '60.00', 'LP5');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('ARE201965', 'Sortija de compromiso', '25 Ene 2019', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'ARE', '60.00', 'LP2');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('GE202156', 'Sortija de compromiso', '08 Ene 2021', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'GE', '60.00', 'O2K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('CO201901', 'Sortija de compromiso', '11 Nov 2019', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'CO', '60.00', 'O2K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('AR201743', 'Sortija de compromiso', '07 Mar 2017', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'AR', '60.00', 'O2K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('DI202078', 'Sortija de compromiso', '29 Ene 2020', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'DI', '60.00', 'LP9');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('ARE202161', 'Sortija de compromiso', '15 Mar 2021', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'ARE', '60.00', 'LP5');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('CO201910', 'Sortija de compromiso', '16 Nov 2019', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'CO', '60.00', 'LP2');


INSERT INTO CategoriaProducto(CodCateg, Descripcion) VALUES('SO', 'Sortija');
INSERT INTO CategoriaProducto(CodCateg, Descripcion) VALUES('DI', 'Dije');
INSERT INTO CategoriaProducto(CodCateg, Descripcion) VALUES('PU', 'Pulsera');
INSERT INTO CategoriaProducto(CodCateg, Descripcion) VALUES('ARE', 'Arete');
INSERT INTO CategoriaProducto(CodCateg, Descripcion) VALUES('GE', 'Gemelo');
INSERT INTO CategoriaProducto(CodCateg, Descripcion) VALUES('CO', 'Collar');
INSERT INTO CategoriaProducto(CodCateg, Descripcion) VALUES('AN', 'Anillo');
INSERT INTO CategoriaProducto(CodCateg, Descripcion) VALUES('AR', 'Aro de matrimonio');

INSERT INTO Pureza(CodPureza, Pureza) VALUES('O2K', '24 K');
INSERT INTO Pureza(CodPureza, Pureza) VALUES('O1K', '18 K');
INSERT INTO Pureza(CodPureza, Pureza) VALUES('LP9', 'Ley 999');
INSERT INTO Pureza(CodPureza, Pureza) VALUES('LP5', 'Ley 950');
INSERT INTO Pureza(CodPureza, Pureza) VALUES('LP2', 'Ley 925');

INSERT INTO ItemCotizacion(Cantidad, PrecioUnitarioCotiz, Especificacion, CodCotizacion, CodCateg, CodPureza) VALUES();

INSERT INTO Cotizacion(ValorPrecio, Estado, PlazoEntrega, CodParty, FechaCreacion) VALUES()