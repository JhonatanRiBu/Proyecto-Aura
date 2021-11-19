create table Party(
    CodParty integer NOT NULL AUTO_INCREMENT,
    DNI varchar(50),
    primary key(CodParty),
    foreign key(DNI) references Cliente(DNI)
);

insert into party (DNI) Values (74196151);
insert into party (DNI) Values (74196152);
insert into party (DNI) Values (74196153);
insert into party (DNI) Values (74196154);
insert into party (DNI) Values (74196155);
insert into party (DNI) Values (74196156);
insert into party (DNI) Values (74196157);

create table TipoRol(
    CodTipPartyRol varchar(50),
    Descripcion varchar(50),
    primary key(CodTipPartyRol)
);

insert into TipoRol (CodTipPartyRol, Descripcion) values ("1","Cliente");
insert into TipoRol (CodTipPartyRol, Descripcion) values ("2","Encargado de logística");
insert into TipoRol (CodTipPartyRol, Descripcion) values ("3","Asistente comercial");

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

insert into Usuario (DNI, Nombre, ApellidoPat, ApellidoMat, CodTipPartyRol, NomUsuario, Contrasena)
values ("74196151", "Jhon", "Vera", "Flores","2","jhonV","jhonV123");
insert into Usuario (DNI, Nombre, ApellidoPat, ApellidoMat, CodTipPartyRol, NomUsuario, Contrasena)
values ("74196152", "Jesús", "Purizaga", "Ñaupas","3","jesusP","jesusp123");

create table StockMP(
    CodMateriaPrima varchar(50),
    Stock Integer,
    CodUMedida varchar(50)
    foreign key(CodMateriaPrima) references MateriaPrima(CodMateriaPrima),
    foreign key(CodUMedida) references UnidadMedida(CodUMedida)
);

insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ("MP1", 50, "g");
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ("MP2", 50, "g");
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ("MP3", 50, "g");
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ("MP4", 50, "g");
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ("MP5", 50, "g");
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ("MP6", 50, "g");
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ("MP7", 50, "g");
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ("MP8", 50, "g");

create table UnidadMedida(
    CodUMedida varchar(50),
    Descripcion varchar(100),
    primary key(CodUMedida)
);

insert into UnidadMedida (CodUMedida, Descripcion) values ("Kg","Kilogramos");
insert into UnidadMedida (CodUMedida, Descripcion) values ("g","gramos");
insert into UnidadMedida (CodUMedida, Descripcion) values ("Oz","Onzas");

create table MateriaPrima(
    CodMateriaPrima varchar(50),
    NombMateriaPrima varchar(50),
    Descripcion varchar(50),
    CodTipoMP varchar(50),
    CodPureza varchar(50),
    primary key(CodMateriaPrima),
    foreign key(CodTipoMP) references TipoMateriaPrima(CodTipoMP),
    foreign key(CodPureza) references Pureza(CodPureza)
);

insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ("MP1", "Oro", "Oro de 24 kilates", "TMP1", "Pz1");
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ("MP2", "Oro", "Oro de 18 kilates", "TMP1", "Pz2");
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ("MP3", "Plata", "Plata de ley 999", "TMP2", "Pz3");
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ("MP4", "Plata", "Plata de ley 950", "TMP2", "Pz4");
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ("MP5", "Plata", "Plata de ley 925", "TMP2", "Pz5");
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ("MP6", "Diamante", "Diamante VS1", "TMP3", "Pz6");
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ("MP7", "Diamante", "Diamante VS2", "TMP3", "Pz7");
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ("MP8", "Rubí", "Rubíes ", "TMP3", "Pz7");


create table TipoMateriaPrima(
    CodTipoMP varchar(50),
    Descripcion varchar(50),
    primary key(CodTipoMP)
);

insert into TipoMateriaPrima (CodTipoMP, Descripcion) Values ("TMP1", "Oro");
insert into TipoMateriaPrima (CodTipoMP, Descripcion) Values ("TMP2", "Plata");
insert into TipoMateriaPrima (CodTipoMP, Descripcion) Values ("TMP3", "Piedras preciosas");
