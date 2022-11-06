#Alineacion
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Deportes(idDeporte,categoria,nombre) /*insertar valores a la tabla deportes*/ 
values 
(1,'pelota','futbol'),
(2,'pelota','basquetbol'),
(3,'pelota','handball'),
(4,'pelota','voleybol'),
(5,'mental','ajedrez'),
(6,'palo','cricket'),
(7,'palo','equitacion');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Encuentros(idDeporte, idEncuentro,fechaComienzo, fechaFinaliza, descripcionEncuentro)
values
(1, 7,'2022-12-17 00:59:59','2022-12-17 23:59:59',"Final" ),
(1, 8,'2022-12-17 00:59:59','2022-12-17 23:59:59',"Amistoso" ),
(2, 9,'2022-12-17 00:59:59','2022-12-17 23:59:59',"Amistoso" ),
(3, 10,'2022-12-17 00:59:59','2022-12-17 23:59:59',"Cuartos Final"),
(2, 11,'2022-12-17 0059:59','2022-12-17 23:59:59',"Semi-final" ),
(1, 12,'2022-12-17 00:59:59','2022-12-17 23:59:59', "Clasificatoria");
insert into Encuentros(idDeporte, idEncuentro,fechaComienzo, fechaFinaliza, descripcionEncuentro)
values
(1, 1,'2022-05-15 15:15:00','2022-05-15 17:15:00',"Final" ),
(1, 2,'2021-05-15 17:15:00','2021-05-15 19:15:00',"Amistoso" ),
(2, 3,'2020-09-15 00:00:00','2020-09-15 02:15:00',"Amistoso" ),
(3, 4,'2023-12-15 13:02:00','2023-12-15 15:02:00',"Cuartos Final"),
(2, 5,'2021-04-15 06:27:00','2021-04-15 08:27:00',"Semi-final" ),
(1, 6,'2022-01-15 02:12:1','2022-01-15 04:12:00', "Clasificatoria");
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Equipos(idDeporte, idEquipo,categoria,logo,nombre,pais) /*insertar valores a la tabla equipos*/
values
(1, 1,'primera','http//megalovania','Peniarol','espania'),
(2, 2,'segunda','http//megalovania','real madrid','espania'),
(1, 3,'tercera','http//megalovania','barcelona','espania'),
(1, 4,'sub-15','http//megalovania','aguada','uruguay'),
(2, 5,'sub-16','http//megalovania','redbull','estados unidos'),
(1, 6,'sub-17','http//megalovania','ELtorque','estados unidos');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Jugador(idJugador,nombre,apellido,edad,sexo,paisNacimiento) /*insertar valores a la tabla jugador*/
values
(1,'luis','suarez',25,'m','uruguay'),
(2,'lionel','messi',30,'m','argentina'),
(3,'pamela','cuevas',20,'f','colombia'),
(4,'eric','cruz',20,'m','rusia'),
(5,'lolo','momo',20,'f','chekoslovaquia'),
(6,'lala','mama',20,'f','francia'),
(7,'pepe','pepin',32,'f','Yemen'),
(8,'Jorge','jorgin',5,'f','China'),
(9,'Delilla','delillin',65,'f','Honduras'),
(10,'Gonsalez','Gonzalin',48,'f','Homan'),
(11,'Sanchez','Sanchin',52,'f','Oman'),
(12,'Andres','Andresin',12,'f','Peru'),
(13,'Martin','tin',14,'f','Uruguay'),
(14,'Juansin','tin',21,'f','Argentina'),
(15,'lele','meme',20,'f','italia');

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Publicidad(idPublicidad,url)/*insertar valores a la tabla publicidad*/
values
(1,'http//la_monalisa'),
(2,'http//jabones_dove'),
(3,'http//azucar_bella_union'),
(4,'http//jugo_ades'),
(5,'http//gatorade');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Alineacion(idAlineacion,idJugador, Poscion) /*insertar valores a la tabla alineacion*/ 
values 
(1,9,'delantero'),
(2,10,'arquero'),
(3,13,'pateador'),
(4,8,'delantero'),
(6,14,'arquero'),
(7,9,'pateador'),
(8,5,'saguero');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Resultados (idResultado) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11);


insert into Puntos(idResultado,idEquipo,Puntos) 
values
(1,1,2),
(2,2,1),
(3,3,78);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
insert into Particular(idResultado,setsGanados,idEquipo)
values
(4,1,2),
(5,2,4),
(6,2,3);

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Rankings(idResultado,posicion,idEquipo)/*insertar valores a la tabla rankings*/
values
(7,"primero",1),
(8,'cuarto',2),
(9,'utlimo',3),
(10,'cuarto',4);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Forman(idJugador,idEquipo, idDeporteEquipo)/*insertar valores a la tabla forman*/
values
(9,1,1),
(10,1,1),
(13,1,1),
(8,1,1),
(14,2,2),
(2,3,1);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Torneos(idDeporte,idTorneo,fechaComienzo,fechaFinalizado,nombreTorneo)/*insertar valores a la tabla torneos*/
values
(1, 1,'2022-6-20 15:00:00','2022-6-21 17:00:00','Copa Libertadores de America'),
(2, 2,'2021-2-1 14:54:00','2021-8-9 19:54:00','redbull'),
(1, 3,'2020-9-9 17:30:00','2020-12-8 22:30:00','bishop'),
(1, 4,'1999-12-31 04:45:00','2000-1-1 10:45:00','new year walk'),
(3, 5,'2009-1-1 06:30:00','2119-12-31 06:30:00','jo mama');
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Usuarios(idUsuario)/*insertar valores a la tabla ususarios padre*/ 
values
(1),
(2),
(3),
(4),
(5);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Guest(idUsuario,nombreAutogen, mac)/*insertar valores a la tabla guest*/
values
(1,'guest-5852858585', 'XX-XX-XX-XX'),
(2,'guest-758527455', 'YY-XX-XX-XX'	);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Vip(idUsuario,correo,contrasenia,nombre,mesesSuscritos,rol)/*insertar valores a la tabla vip*/
values
(3,'c@gmail.com','132','lorenzo',24,2),
(4,'d@gmail.com','213','emiliano',1,1),
(5,'e@gmail.com','321','clara',100,2);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Tiene_Usuario(idPublicidad,idUsuario)/*insertar valores a la tabla tiene usuario*/
values
(1,1),
(2,2);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Visualiza(idUsuario,idEncuentro, idDeporte)/*insertar valores a la tabla visualiza*/
values
(1,1,1),
(1,2,1),
(2,1,1),
(1,3,2),
(3,1,1);

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Compite(idDeporteEncuentro, idEncuentro,idEquipo, idJugador, idDeporteEquipo)/*insertar valores a la tabla compite*/
values
(1, 1, 1, 9,  1),
(1, 1, 1, 10, 1),
(1, 1, 1, 13, 1),
(1, 1, 1, 8,  1),                
(2, 3, 2, 14, 2),
(1, 1, 3, 2,  1);

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into DeportesFavoritos(idUsuario,DeporteFavorito)/*insertar valores a la tabla deportes favoritos*/
values
(3,2),
(4,2),
(5,2),
(4,1),
(3,3);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into EquiposFavoritos(idUsuario,idEquipoFavorito, idDeporte)/*insertar valores a la tabla deportes favoritos*/
values
(4,1,1),
(3,1,1),
(5,2,2),
(5,1,1),
(3,4,1),
(3,3,1);

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Utiliza (idAlineacion, idEncuentro, idDeporte)
values
(1,1,1),
(2,1,1),
(3,1,1),
(4,1,1),
(6,1,1),
(7,2,1),
(8,2,1);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Ocurrencias(idOcurrencia, nombre) values
(1,"Tarjeta Roja"),
(2,"Tarjeta Amarilla"),
(3,"Gol"),
(5,"Tiro libre"),
(6,"Gana set"),
(7,"Primer Lugar"),
(8,"Penal");

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Incidencias(IdIncidencia, minuto, idJugador)values
(1, 87, 2),
(2, 49, 2),
(3, 57, 3),
(4, 91, 5),
(5, 02, 4);
/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Hacen(idIncidencia, idOcurrencia) values
(1, 1),
(2, 2),
(3, 3),
(5, 5);

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into Notifica(idIncidencia, idOcurrencia, idEncuentro, idDeporte) values
(1, 1, 1,1),
(2, 2, 1,1),
(3, 3, 1,1),
(5, 5, 2,1);

/*'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'*/
insert into torneosTienenEncuentros(idTorneo, idDeporteTorneo,idEncuentro, idDeporteEncuentro, idEquipo) values
(4, 1, 1 ,1, 1),
(4, 1, 1 ,1, 3);

insert into torneosTienenEncuentros(idTorneo, idDeporteTorneo,idEncuentro, idDeporteEncuentro, idEquipo) values
(1, 1, 2 ,1, 1),
(1, 1, 2 ,1, 3);

/*///////////////////////////Creacion usuarios y permisos//////////////////////////////////////////////////////////*/
/*
create user 'usuarioConsultas'@'KnightWare' identified by 'consultasSQL';
GRANT SELECT ON KnightWare.* TO 'usuarioConsultas';
GRANT update, insert ON KnightWare.Vip TO 'usuarioConsultas';
GRANT update, insert ON KnightWare.Usuarios TO 'usuarioConsultas';

create user 'usuarioAdministrador'@'KnightWare' identified by 'administrador1234';
GRANT ALL ON KnightWare.* TO 'usuarioAdministrador';


Only in case of emergency with the users
drop database knightware;
select user, Host from mysql.user;
drop user 'usuarioConsultas'@'localhost';
drop user 'usuarioAdministrador'@'localhost';



*/