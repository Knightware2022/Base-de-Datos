#drop database KnightWare;
create database KnightWareV2;
use KnightWareV2;
create table Deportes(
	idDeporte int primary key,
    categoria varchar(50) not null,
    nombre varchar(50) not null unique
); 
create table Ocurrencias
(
	idOcurrencia int primary key,
    nombre varchar(50) not null unique
);
create table Hacen
(
	idIncidencia int,
    idOcurrencia int,
    primary key (idIncidencia,idOcurrencia)
);
create table Notifica
(
	idIncidencia int,
    idOcurrencia int,
	idEncuentro int,
    idDeporte int,
    primary key (idIncidencia,idOcurrencia, idEncuentro)
);
create table Incidencias
(
	idIncidencia int,
    idJugador int,
    minuto int,
    primary key (idIncidencia)
);
create table Resultados
(
	idResultado int primary key
);
create table Rankings
(
	idResultado int primary key,
    posicion varchar (50),
    idEquipo int not null
);
create table Particular
(
	idResultado int primary key,
    setsGanados int default 0,
    idEquipo int not null
    );
create table Puntos
(
	idResultado int primary key,
    puntos int not null default 0,
    idEquipo int not null
);
create table Jugador
(
	idJugador int primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int not null,
    sexo varchar(1),
    paisNacimiento varchar(30) not null
#	constraint cstrUnique unique(nombre, apellido)
);
create table Equipos
(
	idDeporte int,
	idEquipo int ,
    categoria varchar(50) not null,
    logo varchar(200),
    nombre varchar(30) not null,
    pais varchar(30) not null,
    primary key(idDeporte, idEquipo)
);
create table Forman
(
	idJugador int ,
    idDeporteEquipo  int,
    idEquipo int,
    primary key (idJugador,idEquipo, idDeporteEquipo)
);

create table Encuentros
(
    idDeporte int,
	idEncuentro int unique,
    fechaComienzo datetime not null,
    fechaFinaliza datetime not null,
    descripcionEncuentro varchar(100) not null,
    primary key(idDeporte, idEncuentro)
);

create table Compite
(
	idDeporteEncuentro int,
	idEncuentro int,
    idJugador int,
    idDeporteEquipo int,
    idEquipo int,
    primary key (idDeporteEncuentro, idEncuentro,idEquipo, idDeporteEquipo,idJugador)
);
create table Alineacion
(
	idAlineacion int,
	idJugador int,
    Poscion varchar(60) not null,
	primary key(idAlineacion, idJugador)
);
create table Torneos
(
	idTorneo int ,
    idDeporte int,
    fechaComienzo datetime not null,
    fechaFinalizado datetime not null,
    nombreTorneo varchar(50) not null,
    primary key (idTorneo, idDeporte)
);


create table torneosTienenEncuentros(
	idTorneo int , 
    idDeporteTorneo int, 
    idEncuentro int,
    idEquipo int,
    idDeporteEncuentro int,
    primary key (idTorneo,idDeporteTorneo, idEncuentro, idEquipo, idDeporteEncuentro)
);
create table Usuarios
(
	idUsuario int primary key
);
create table Vip
(
	idUsuario int primary key,
    correo varchar(60) not null ,
    contrasenia varchar(60) not null,
    nombre varchar(40) not null unique,
    mesesSuscritos int not null,
    rol int not null
);
create table EquiposFavoritos
(
	idUsuario int,
    idEquipoFavorito int,
    idDeporte int, 
    primary key (idUsuario,idEquipoFavorito, idDeporte)
);
create table DeportesFavoritos
(
	idUsuario int,
    deporteFavorito int,
    primary key (idUsuario,deporteFavorito)
);
create table Guest
(
	idUsuario int primary key,
    mac varchar(30) not null unique,
    nombreAutogen varchar(100) not null
);
create table Visualiza
(
	idUsuario int,
    idEncuentro int,
    idDeporte int,
    primary key (idUsuario,idEncuentro, idDeporte)
);	
create table Publicidad
(
	idPublicidad int primary key,
    url varchar(500)
);
create table Tiene_Usuario
(
	idPublicidad int,
    idUsuario int,
    primary key (idPublicidad,idUsuario)
);

create table Utiliza
(
	idAlineacion int,
    idEncuentro int,
    idDeporte int,
    primary key(idAlineacion,idEncuentro, idDeporte)
);
alter table Forman add constraint rs_Unique unique(idJugador);#se debe deshablitar si se quiere que un jugador pertenezca a mas de 1 equipo 
alter table Vip add constraint uk_correo unique(correo);
alter table Compite add constraint fk_compiteENCU foreign key (idEncuentro, idDeporteEncuentro) references Encuentros(idEncuentro, idDeporte) on delete cascade;
alter table DeportesFavoritos add constraint fk_depoFavUSU foreign key (idUsuario) references Vip(idUsuario) on delete cascade;
alter table DeportesFavoritos add constraint fk_depoFavDEPO foreign key (deporteFavorito) references Deportes(idDeporte) on delete cascade;
alter table Forman add constraint fk_formanJUGA foreign key (idJugador) references Jugador(idJugador);
alter table Guest add constraint fk_guest foreign key (idUsuario) references Usuarios(idUsuario) on delete cascade;
alter table Equipos add constraint fk_idDeporte foreign key (idDeporte) references Deportes(idDeporte);
alter table Encuentros add constraint fk_idDeporteEn foreign key (idDeporte) references Deportes(idDeporte);
alter table Tiene_Usuario add constraint fk_tiene_usuPUB foreign key (idPublicidad) references Publicidad(idPublicidad);
alter table Tiene_Usuario add constraint fk_tiene_usuUSU foreign key (idUsuario) references Guest(idUsuario);
alter table Vip add constraint fk_vip foreign key (idUsuario) references Usuarios(idUsuario);
alter table Visualiza add constraint fk_visaUSU foreign key (idUsuario) references Usuarios(idUsuario);
alter table Jugador add constraint ck_jugaSexo check(sexo = 'f' or sexo = 'm');
alter table Vip add constraint ck_usuRol check(rol >= 0);
alter table Vip add constraint ck_vipMesesSus check(mesesSuscritos >= 0);

alter table Utiliza add CONSTRAINT `fk_utiliALI` FOREIGN KEY (`idAlineacion`) REFERENCES `Alineacion` (`idAlineacion`);
alter table Hacen add CONSTRAINT `fk_hacenOcu` FOREIGN KEY (`idOcurrencia`) REFERENCES `Ocurrencias` (`idOcurrencia`);
alter table Hacen add CONSTRAINT `fk_hacenInci` FOREIGN KEY (`idIncidencia`) REFERENCES `Incidencias` (`idIncidencia`);
alter table Notifica add CONSTRAINT `fk_notificaInci` FOREIGN KEY (idIncidencia, idOcurrencia) REFERENCES Hacen (idIncidencia, idOcurrencia) on delete cascade ;
alter table EquiposFavoritos add constraint fk_EquipoidUsu foreign key (idUsuario) references VIP(idUsuario);
alter table Alineacion add constraint fk_idJugadorAline foreign key (idJugador) references Jugador(idJugador);
alter table Compite add constraint ck_CompiteDeporte check(idDeporteEncuentro = idDeporteEquipo);

Alter table Torneos add constraint fk_torneosIndiviDepo foreign key(idDeporte) references Deportes(idDeporte);
alter table torneosTienenEncuentros add constraint ck_TorneoColeDeporEncuentro check(idDeporteEncuentro = idDeporteTorneo);
alter table Forman add constraint fk_formanEQUIDepo foreign key (idDeporteEquipo, idEquipo) references Equipos(idDeporte, idEquipo);

alter table Visualiza add constraint fk_visaENCU foreign key (idDeporte, idEncuentro) references Encuentros(idDeporte, idEncuentro) on delete cascade;
alter table Utiliza add CONSTRAINT `fk_utiliENCU` FOREIGN KEY (idDeporte, idEncuentro) REFERENCES `Encuentros` (idDeporte, idEncuentro);
alter table Notifica add CONSTRAINT `fk_notificaEncu` FOREIGN KEY (idDeporte, idEncuentro) REFERENCES `Encuentros` (idDeporte, idEncuentro) on delete cascade;
alter table EquiposFavoritos add constraint fk_EquipoFavUSU foreign key (idDeporte, idEquipoFavorito) references Equipos(idDeporte, idEquipo);
alter table Compite add constraint fk_compiteJUGAEquiDepo foreign key (idJugador,idEquipo,idDeporteEquipo) references Forman(idJugador,idEquipo, idDeporteEquipo) ;

alter table torneosTienenEncuentros add constraint fkTorneoColeTorn foreign key (idTorneo, idDeporteTorneo) references Torneos (idTorneo, idDeporte);
alter table torneosTienenEncuentros add constraint fkTorneoColeEncu foreign key (idDeporteEncuentro, idEncuentro,idEquipo) references Compite (idDeporteEncuentro,idEncuentro, idEquipo);

alter table Encuentros add constraint ck_Fechas check(fechaFinaliza > fechaComienzo);
alter table Torneos add constraint ck_FechasTorn check(fechaFinalizado > fechaComienzo);

alter table torneosTienenEncuentros add constraint ck_DepoColecTorn check(idDeporteTorneo = idDeporteEncuentro);

alter table Rankings add constraint fkInciRAnk foreign key(idResultado) references Resultados(idResultado);
alter table Particular add constraint fkInciParti foreign key(idResultado) references Resultados(idResultado);
alter table Puntos add constraint fkInciParti_par foreign key(idResultado) references Resultados(idResultado);