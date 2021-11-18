create table Party(
    CodParty varchar(50),
    DNI varchar(50)
    primary key(CodParty),
    foreign key(DNI) references Cliente(DNI)
);

create table TipoRol(
    CodTipPartyRol varchar(50),
    Descripcion varchar(50),
    primary key(CodTipPartyRol)
);

create table Usuario(
    DNI varchar(50),
    Nombre varchar(50),
    ApellidoPat varchar(50),
    ApellidoMat varchar(50),
    CodTipPartyRol varchar(50),
    NomUsuario varchar(50),
    Contrasena varchar(200),
    primary key(DNI),
    foreign key(CodTipPartyRol) references TipoRol(CodTipPartyRol)
);

create table StockMP(
    CodMateriaPrima varchar(50),
    Stock Integer,
    CodUMedida varchar(50)
    foreign key(CodMateriaPrima) references MateriaPrima(CodMateriaPrima),
    foreign key(CodUMedida) references UnidadMedida(CodUMedida)
);

create table UnidadMedida(
    CodUMedida varchar(50),
    Descripcion varchar(100),
    primary key(CodUMedida)
);

create table MateriaPrima(
    CodMateriaPrima varchar(50),
    NombMateriaPrima varchar(50),
    Descripcion varchar(50),
    CodTipoMP varchar(50),
    CodPureza varchar(50),
    Stock Integer
    primary key(CodMateriaPrima),
    foreign key(CodTipoMP) references TipoMateriaPrima(CodTipoMP),
    foreign key(CodPureza) references Pureza(CodPureza)
);

create table TipoMateriaPrima(
    CodTipoMP varchar(50),
    Descripcion varchar(50),
    primary key(CodTipoMP)
);

