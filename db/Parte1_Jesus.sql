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

INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('SO201925', 'Sortija de compromiso', '14 Mar 2019', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'SO', 60.00, 'LP2');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('DI202014', 'Dije modelo libélula fina', '24 Abr 2020', 'Dije con modelo de libelula fina bañada en oro de 18K con tamaño de 1.5 cm x 2cm', 'DI', 90.00, '18K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('PU201889', 'Pulsera', '19 Mar 2018', 'Pulsera Puñera para mujer plata 950 con dije de corazón swarovski colores Lb', 'PU', 40.00, 'LP5');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('SO202129', 'Sortija embutida espiral alto relieve', '25 Ene 2019', 'Sortija embutida espiral alto relieve de plata ley 925', 'SO', 150.00, 'LP2');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('SO202047', 'Sortija cuadrada con piedra luna negro', '08 Ene 2021', 'Sortija cuadrada con piedra luna negro incrustada en el alto relieve', 'SO', 240.00, 'O2K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('CO201901', 'Collar Venice Oro', '11 Nov 2019', 'Collar Venice con dije luna  de oro 24K', 'CO', 120.00, 'O2K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('AR201743', 'Aros de matrimonio', '07 Mar 2017', 'Oro Amarillo 375 / Circonita', 'AR', 1500.00, 'O2K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('DI202078', 'Dije señor de los milagros', '29 Ene 2020', 'Dije con diseño del señor de los milagros y colores plateado y morado', 'DI', 160.00, 'LP9');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('ARE202161', 'Arete', '15 Mar 2021', 'Arete con piedas celeste en la curvatura inferior de plata ley 950', 'ARE', 68.00, 'LP5');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('CO201910', 'Collar', '16 Nov 2019', 'Collar con decoración de cadena y dije de estrella de plata ley 925', 'CO', 79.00, 'LP2');


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

INSERT INTO ItemCotizacion(Cantidad, PrecioUnitarioCotiz, Especificacion, CodCotizacion, CodCateg, CodPureza) VALUES(1, 150.00, 'Sortija de plata ley 950 con decoración en el alto relieve de cristal transparente', 1, 'SO', 'LP5');
INSERT INTO ItemCotizacion(Cantidad, PrecioUnitarioCotiz, Especificacion, CodCotizacion, CodCateg, CodPureza) VALUES(1, 200.00, 'Dije circular 1 cm x 1 cm con escritura nombre Ana de oro 24K', 2, 'DI', 'O2K');
INSERT INTO ItemCotizacion(Cantidad, PrecioUnitarioCotiz, Especificacion, CodCotizacion, CodCateg, CodPureza) VALUES(1, 210.00, 'Collar de plata ley 950 con dije escritura nombre Dahana', 3, 'CO', 'LP5');
INSERT INTO ItemCotizacion(Cantidad, PrecioUnitarioCotiz, Especificacion, CodCotizacion, CodCateg, CodPureza) VALUES(1, 300.00, 'Anillo sin decoración en el alto relieve de oro 24K 0.5 crt', 4, 'AN', 'O2K');

INSERT INTO Cotizacion(ValorPrecio, Estado, PlazoEntrega, CodParty, FechaCreacion) VALUES(150.00, 'Realizado', '25 Mar 2021', '7', '11 Mar 2021');
INSERT INTO Cotizacion(ValorPrecio, Estado, PlazoEntrega, CodParty, FechaCreacion) VALUES(200.00, 'Pendiente', '30 Nov 2021', '6', '11 Nov 2021');
INSERT INTO Cotizacion(ValorPrecio, Estado, PlazoEntrega, CodParty, FechaCreacion) VALUES(250.00, 'Pendiente', '29 Nov 2021', '8', '11 Nov 2021');
INSERT INTO Cotizacion(ValorPrecio, Estado, PlazoEntrega, CodParty, FechaCreacion) VALUES(300.00, 'Pendiente', '28 Nov 2021', '4', '11 Nov 2021');