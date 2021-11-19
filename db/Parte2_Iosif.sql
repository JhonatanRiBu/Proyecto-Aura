create table TipoMateriaPrima(
    CodTipoMP varchar(50),
    Descripcion varchar(50),
    primary key(CodTipoMP)
);

insert into TipoMateriaPrima (CodTipoMP, Descripcion) Values ('TMP1', 'Metal');
insert into TipoMateriaPrima (CodTipoMP, Descripcion) Values ('TMP2', 'Metal Precioso');
insert into TipoMateriaPrima (CodTipoMP, Descripcion) Values ('TMP3', 'Piedra');


create table TipoRol(
    CodTipPartyRol varchar(50),
    Descripcion varchar(50),
    primary key(CodTipPartyRol)
);

insert into TipoRol (CodTipPartyRol, Descripcion) values ('cl','Cliente');
insert into TipoRol (CodTipPartyRol, Descripcion) values ('log','Encargado de logística');
insert into TipoRol (CodTipPartyRol, Descripcion) values ('com','Asistente comercial');

create table UnidadMedida(
    CodUMedida varchar(50),
    Descripcion varchar(100),
    primary key(CodUMedida)
);

insert into UnidadMedida (CodUMedida, Descripcion) values ('Kg','Kilogramos');
insert into UnidadMedida (CodUMedida, Descripcion) values ('g','gramos');
insert into UnidadMedida (CodUMedida, Descripcion) values ('Oz','Onzas');


create table Party(
    CodParty integer NOT NULL AUTO_INCREMENT,
    DNI varchar(50),
    primary key(CodParty),
    primary key(DNI)
);

insert into party (DNI) Values ('74196151');
insert into party (DNI) Values ('74196152');
insert into party (DNI) Values ('70503215');
insert into party (DNI) Values ('70154312');
insert into party (DNI) Values ('50341231');
insert into party (DNI) Values ('26242032');
insert into party (DNI) Values ('23029322');
insert into party (DNI) Values ('35040230');
insert into party (DNI) Values ('32992392');
insert into party (DNI) Values ('42020022');
insert into party (DNI) Values ('24204200');
insert into party (DNI) Values ('70340034');


create table Usuario(
    DNI varchar(50),
    Nombre varchar(50),
    ApellidoPat varchar(50),
    ApellidoMat varchar(50),
    CodTipPartyRol varchar(50),
    NomUsuario varchar(50),
    Contrasena varchar(200),
    primary key(DNI),
    foreign key(DNI) references Party(DNI),
    foreign key(CodTipPartyRol) references TipoRol(CodTipPartyRol)
);

insert into Usuario (DNI, Nombre, ApellidoPat, ApellidoMat, CodTipPartyRol, NomUsuario, Contrasena)
values ('74196151', 'Jhon', 'Vera', 'Flores','2','jhonV','jhonV123');
insert into Usuario (DNI, Nombre, ApellidoPat, ApellidoMat, CodTipPartyRol, NomUsuario, Contrasena)
values ('74196152', 'Jesus', 'Purizaga', 'Naupas','3','jesusP','jesusp123');

create table MateriaPrima(
    CodMateriaPrima varchar(50),
    NombMateriaPrima varchar(50),
    Descripcion varchar(50),
    CodTipoMP varchar(50),
    primary key(CodMateriaPrima),
    foreign key(CodTipoMP) references TipoMateriaPrima(CodTipoMP)
);

insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ('MP1', 'Oro', 'Oro de 24 kilates', 'TMP1',);
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ('MP2', 'Oro', 'Oro de 18 kilates', 'TMP1',);
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ('MP3', 'Plata', 'Plata de ley 999', 'TMP2',);
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ('MP4', 'Plata', 'Plata de ley 950', 'TMP2',);
insert into MateriaPrima(CodMateriaPrima, NombMateriaPrima, Descripcion, CodTipoMP, CodPureza)
values ('MP5', 'Plata', 'Plata de ley 925', 'TMP2',);

create table StockMP(
    CodMateriaPrima varchar(50),
    Stock Integer,
    CodUMedida varchar(50),
    foreign key(CodMateriaPrima) references MateriaPrima(CodMateriaPrima),
    foreign key(CodUMedida) references UnidadMedida(CodUMedida)
);

insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ('MP1', 50, 'g');
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ('MP2', 50, 'g');
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ('MP3', 50, 'g');
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ('MP4', 50, 'g');
insert into StockMP (CodMateriaPrima, Stock, CodUMedida) values ('MP5', 50, 'g');




