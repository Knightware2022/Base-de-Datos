#drop database KnightWareV2;
create database KnightWareV2;
use KnightWareV2;

create table Deportes(
	idDeporte int primary key,
    categoria varchar(50) not null,
    nombre varchar(50) not null unique
); 
create table Resultados
(
	idResultados int primary key
);
create table Rankings
(
	idResultado int primary key,
    tiempo_Transcurrido time not null,
    puntos int not null,
    posicion int not null,
    nombreJugador varchar(40)
);
create table Particular
(
	idResultado int primary key,
    puntosVisi int not null,
	puntosLocal int not null,
    setsVisi int not null,
	setsLocal int not null,
    ventaja boolean
);
create table Puntos
(
	idResultado int primary key,
    puntosLocal int not null,
    puntosVisi int not null

);

create table Genera
(
	idEncuentro int,
    idDeporte int,
    idResultado int,
    primary key (idEncuentro,idResultado, idDeporte)
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
    primary key (idIncidencia,idOcurrencia, idEncuentro, idDeporte)
);
create table Incidencias
(
	idIncidencia int,
    idJugador int not null,
	minuto int not null,
    primary key (idIncidencia)
);
 create table Participantes
(
	idDeporte int,
	idParticipante int,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int not null,
    sexo varchar(1),
    paisNacimiento varchar(30) not null,
    primary key (idDeporte, idParticipante)
);

create table Jugador
(
	idJugador int primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int not null,
    sexo varchar(1),
    paisNacimiento varchar(30) not null
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
	idEncuentro int,
    fechaComienzo datetime not null,
    fechaFinaliza datetime not null,
    descripcionEncuentro varchar(100) not null,
    primary key(idDeporte, idEncuentro)
);
create table Competencia_Colectiva
(
	idEncuentro int,
    idDeporte int,
    primary key (idEncuentro, idDeporte)
);
create table Competencia_Individual
(
	idEncuentro int,
    idDeporte int,
    primary key (idEncuentro, idDeporte)
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

create table Participa
(
	idDeporteEncuentro int,
	idEncuentro int,
    idParticipante int,
    idDeporteParticipante int,
    primary key (idDeporteEncuentro, idEncuentro, idParticipante,idDeporteParticipante)
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
    nombreTorneo varchar(40) not null,
    primary key (idTorneo, idDeporte)
);

create table torneosIndividuales(
	idTorneo int,
    idDeporte int,
    primary key(idTorneo, idDeporte)
);
create table torneosColectivos(
    idTorneo int,
    idDeporte int,
    primary key(idTorneo, idDeporte));


create table torneosTienenEncuentrosIndivi(
	idTorneo int, 
    idDeporteTorneo int,
    idEncuentro int,
    idDeporteEncuentro int,
    idParticipante int,
    primary key (idTorneo, idDeporteTorneo, idDeporteEncuentro, idEncuentro, idParticipante)
);

create table torneosTienenEncuentrosEquipos(
	idTorneo int, 
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

alter table Vip add constraint uk_correo unique(correo);
alter table Compite add constraint fk_compiteENCU foreign key (idEncuentro, idDeporteEncuentro) references Competencia_Colectiva(idEncuentro, idDeporte) on delete cascade;
alter table DeportesFavoritos add constraint fk_depoFavUSU foreign key (idUsuario) references Vip(idUsuario) on delete cascade;
alter table DeportesFavoritos add constraint fk_depoFavDEPO foreign key (deporteFavorito) references Deportes(idDeporte) on delete cascade;
alter table Forman add constraint fk_formanJUGA foreign key (idJugador) references Jugador(idJugador);
alter table Guest add constraint fk_guest foreign key (idUsuario) references Usuarios(idUsuario) on delete cascade;
alter table Equipos add constraint fk_idDeporte foreign key (idDeporte) references Deportes(idDeporte);
alter table Encuentros add constraint fk_idDeporteEn foreign key (idDeporte) references Deportes(idDeporte);
alter table Participantes add constraint fk_idDeporteParti foreign key (idDeporte) references Deportes(idDeporte);
alter table Rankings add constraint fk_rankings foreign key (idResultado) references Resultados(idResultados);
alter table Tiene_Usuario add constraint fk_tiene_usuPUB foreign key (idPublicidad) references Publicidad(idPublicidad);
alter table Tiene_Usuario add constraint fk_tiene_usuUSU foreign key (idUsuario) references Guest(idUsuario);
alter table Vip add constraint fk_vip foreign key (idUsuario) references Usuarios(idUsuario);
alter table Visualiza add constraint fk_visaUSU foreign key (idUsuario) references Usuarios(idUsuario);
alter table Jugador add constraint ck_jugaSexo check(sexo = 'f' or sexo = 'm');
alter table Participantes add constraint ck_partiSexo check(sexo = 'f' or sexo = 'm');
alter table Vip add constraint ck_usuRol check(rol >= 0);
alter table Vip add constraint ck_vipMesesSus check(mesesSuscritos > 0);
alter table Utiliza add CONSTRAINT `fk_utiliALI` FOREIGN KEY (`idAlineacion`) REFERENCES `Alineacion` (`idAlineacion`);
alter table Genera add CONSTRAINT `fk_generaResu` FOREIGN KEY (`idResultado`) REFERENCES `Resultados` (`idResultados`);
alter table Hacen add CONSTRAINT `fk_hacenOcu` FOREIGN KEY (`idOcurrencia`) REFERENCES `Ocurrencias` (`idOcurrencia`);
alter table Hacen add CONSTRAINT `fk_hacenInci` FOREIGN KEY (`idIncidencia`) REFERENCES `Incidencias` (`idIncidencia`);
alter table Notifica add CONSTRAINT `fk_notificaInci` FOREIGN KEY (idIncidencia, idOcurrencia) REFERENCES Hacen (idIncidencia, idOcurrencia) on delete cascade ;
alter table EquiposFavoritos add constraint fk_EquipoidUsu foreign key (idUsuario) references VIP(idUsuario);
alter table Alineacion add constraint fk_idJugadorAline foreign key (idJugador) references Jugador(idJugador);
alter table Puntos add constraint fk_idResu foreign key (idResultado) references Resultados(idResultados);
alter table Rankings add constraint fk_idResuRank foreign key (idResultado) references Resultados(idResultados);
alter table Particular add constraint fk_idResParti foreign key (idResultado) references Resultados(idResultados);
alter table Compite add constraint ck_CompiteDeporte check(idDeporteEncuentro = idDeporteEquipo);
alter table Participa add constraint ck_ParticipaDeporte check(idDeporteEncuentro = idDeporteParticipante);
Alter table Torneos add constraint fk_torneosIndiviDepo foreign key(idDeporte) references Deportes(idDeporte);
Alter table torneosIndividuales add constraint fk_torneosIndivi foreign key(idTorneo, idDeporte) references Torneos(idTorneo, idDeporte);
Alter table torneosColectivos add constraint fk_torneosColec foreign key(idTorneo, idDeporte) references Torneos(idTorneo, idDeporte);
alter table torneosIndividuales add constraint fkDeporteTorneoIndi foreign key (idDeporte) references Deportes (idDeporte);
alter table torneosColectivos add constraint fkDeporteTorneoCole foreign key (idDeporte) references Deportes (idDeporte);
alter table torneosTienenEncuentrosEquipos add constraint ck_TorneoColeDeporEncuentro check(idDeporteEncuentro = idDeporteTorneo);
alter table Forman add constraint fk_formanEQUIDepo foreign key (idDeporteEquipo, idEquipo) references Equipos(idDeporte, idEquipo);
alter table Competencia_Colectiva add constraint fk_compCole foreign key (idDeporte, idEncuentro) references Encuentros(idDeporte, idEncuentro) on delete cascade;
alter table Competencia_Individual add constraint fk_compIndi foreign key (idDeporte, idEncuentro) references Encuentros(idDeporte, idEncuentro) on delete cascade;
alter table Participa add constraint fk_partiENCUE foreign key (idDeporteEncuentro, IdEncuentro) references Competencia_Individual(idDeporte, idEncuentro) on delete cascade;
alter table Participa add constraint fk_partiPARTI foreign key (idDeporteParticipante, idParticipante) references Participantes(idDeporte, idParticipante);
alter table Visualiza add constraint fk_visaENCU foreign key (idDeporte, idEncuentro) references Encuentros(idDeporte, idEncuentro) on delete cascade;
alter table Utiliza add CONSTRAINT `fk_utiliENCU` FOREIGN KEY (idDeporte, idEncuentro) REFERENCES `Encuentros` (idDeporte, idEncuentro);
alter table Genera add CONSTRAINT `fk_generaENCU` FOREIGN KEY ( idDeporte, idEncuentro) REFERENCES `Encuentros` (idDeporte, idEncuentro) on delete cascade;
alter table Notifica add CONSTRAINT `fk_notificaEncu` FOREIGN KEY (idDeporte, idEncuentro) REFERENCES `Encuentros` (idDeporte, idEncuentro) on delete cascade;
alter table EquiposFavoritos add constraint fk_EquipoFavUSU foreign key (idDeporte, idEquipoFavorito) references Equipos(idDeporte, idEquipo);
alter table Compite add constraint fk_compiteJUGAEqui foreign key (idJugador,idDeporteEquipo,idEquipo) references Forman(idJugador,idEquipo, idDeporteEquipo) ;
alter table torneosTienenEncuentrosIndivi add constraint fkTorneoIndiTorn foreign key (idTorneo,idDeporteTorneo) references TorneosIndividuales (idTorneo, idDeporte);
alter table torneosTienenEncuentrosIndivi add constraint fkTorneoIndiEncu foreign key (idDeporteEncuentro,idEncuentro,idParticipante) references Participa (idDeporteEncuentro, idEncuentro, idParticipante);
alter table torneosTienenEncuentrosIndivi add constraint ck_TorneoIndiDeporEncuentro check(idDeporteEncuentro = idDeporteTorneo);
alter table torneosTienenEncuentrosEquipos add constraint fkTorneoColeTorn foreign key (idTorneo, idDeporteTorneo) references TorneosColectivos (idTorneo, idDeporte);
alter table torneosTienenEncuentrosEquipos add constraint fkTorneoColeEncu foreign key (idDeporteEncuentro, idEncuentro,idEquipo) references Compite (idDeporteEncuentro,idEncuentro, idEquipo);
alter table Encuentros add constraint ck_Fechas check(fechaFinaliza > fechaComienzo);
