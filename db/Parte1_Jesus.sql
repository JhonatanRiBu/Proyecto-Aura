create table Pedido(
    CodPedido integer,
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
    CodItemCotiz integer,
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
    CodCotizacion integer,
    ValorPrecio numeric(9,2),
    Estado varchar(50),
    PlazoEntrega date,
    CodParty varchar(50),
    FechaCreacion date,
    primary key(CodCotizacion),
    foreign key(CodParty) references Party(CodParty)
);