create table party(
    CodParty varchar(50),
    dni varchar(50)
);

create table TipoRol(
    CodTipPartyRol varchar(50),
    descripcion varchar(50)
);

create table Usuario(
    dni varchar(50),
    Nombre varchar(50),
    ApellidoPat varchar(50),
    ApellidoMat varchar(50),
    CodTipPartyRol varchar(50),
    NomUsuario varchar(50),
    contrasena varchar(50)
);

create table StockMP(
    CodMateriaPrima varchar(50),
    Stock Integer,
    CodUMedida varchar(50)
);

create table UnidadMedida(
    CodUMedida varchar(50),
    descripcion varchar(100)
);

create table MateriaPrima(
    CodMateriaPrima varchar(50),
    NombMateriaPrima varchar(50),
    descripcion varchar(50),
    CodTipoMP varchar(50),
    CodPureza varchar(50),
    Stock Integer
);

create table TipoMateriaPrima(
    CodTipoMP varchar(50),
    descripcion varchar(50)
);

