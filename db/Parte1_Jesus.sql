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

INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '2021-11-19', 4);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '2021-11-18', 3);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '2021-11-17', 6);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '2021-11-16', 7);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '2021-11-15', 5);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '2021-11-14', 4);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '2021-11-13', 3);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '2021-11-12', 5);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '2021-11-11', 6);
INSERT INTO Pedido(Comentario, FechaCreacion, CodParty) VALUES('Ninguna especificacion adicional', '2021-11-10', 7);

INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(1, 'SO201925', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(2, 'SO201925', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(2, 'DI202014', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(3, 'PU201889', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(4, 'SO202129', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(5, 'SO202047', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(6, 'CO201901', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(7, 'AR201743', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(8, 'DI202078', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(9, 'ARE202161', 1);
INSERT INTO ArticuloPedido(CodPedido, CodProducto, Cantidad) VALUES(10, 'CO201910', 1);

INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('SO201925', 'Sortija de compromiso', '2019-03-14', 'Sortija bañada en plata 925 con fina piedra Zirconia cubica', 'SO', 60.00, 'LP2');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('DI202014', 'Dije modelo libélula fina', '2020-04-24', 'Dije con modelo de libelula fina bañada en oro de 18K con tamaño de 1.5 cm x 2cm', 'DI', 90.00, 'O1K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('PU201889', 'Pulsera', '2018-03-19', 'Pulsera Puñera para mujer plata 950 con dije de corazón swarovski colores Lb', 'PU', 40.00, 'LP5');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('SO202129', 'Sortija embutida espiral alto relieve', '2019-01-25', 'Sortija embutida espiral alto relieve de plata ley 925', 'SO', 150.00, 'LP2');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('SO202047', 'Sortija cuadrada con piedra luna negro', '2021-01-08', 'Sortija cuadrada con piedra luna negro incrustada en el alto relieve', 'SO', 240.00, 'O2K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('CO201901', 'Collar Venice Oro', '2019-11-11', 'Collar Venice con dije luna  de oro 24K', 'CO', 120.00, 'O2K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('AR201743', 'Aros de matrimonio', '2017-03-07', 'Oro Amarillo 375 / Circonita', 'AR', 1500.00, 'O2K');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('DI202078', 'Dije señor de los milagros', '2020-01-29', 'Dije con diseño del señor de los milagros y colores plateado y morado', 'DI', 160.00, 'LP9');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('ARE202161', 'Arete', '2021-03-15', 'Arete con piedas celeste en la curvatura inferior de plata ley 950', 'ARE', 68.00, 'LP5');
INSERT INTO Producto(CodProducto, NomProducto, FechaIntroduccion, Descripcion, CodCateg, Precio, CodPureza) VALUES('CO201910', 'Collar', '2019-11-16', 'Collar con decoración de cadena y dije de estrella de plata ley 925', 'CO', 79.00, 'LP2');


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

INSERT INTO Cotizacion(ValorPrecio, Estado, PlazoEntrega, CodParty, FechaCreacion) VALUES(150.00, 'Realizado', '2021-03-25', '7', '2021-03-11');
INSERT INTO Cotizacion(ValorPrecio, Estado, PlazoEntrega, CodParty, FechaCreacion) VALUES(200.00, 'Pendiente', '2021-11-30', '6', '2021-11-11');
INSERT INTO Cotizacion(ValorPrecio, Estado, PlazoEntrega, CodParty, FechaCreacion) VALUES(250.00, 'Pendiente', '2021-11-29', '8', '2021-11-11');
INSERT INTO Cotizacion(ValorPrecio, Estado, PlazoEntrega, CodParty, FechaCreacion) VALUES(300.00, 'Pendiente', '2021-11-28', '4', '2021-11-11');