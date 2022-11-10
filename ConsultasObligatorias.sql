#1 encuentros de futbol al dia 17/12/2022

select en.descripcionEncuentro, en.fechaComienzo
from Encuentros as en, deportes as d
where en.fechaComienzo>'2022-12-16 23:59:59' AND en.fechaFinaliza<'2022-12-18 00:00:00'
AND en.idDeporte=d.idDeporte AND d.nombre = 'futbol';

#2 nombre de los usuarios VIP
select nombre
from VIP;
 
#3 nombre de usuarios que reciben notificaciones (siguen) a aguada
Select v.idUsuario, v.Nombre, e.nombre as nombreEquipo
from Vip as v, EquiposFavoritos as ef, Equipos as e
where v.idUsuario=ef.idUsuario AND ef.idEquipoFavorito = e.idEquipo AND e.nombre="Aguada";

#4 listar aquellos usuarios que ven una publicidad dada
select g.nombreAutogen 
from Guest as g, Tiene_Usuario as t
where t.idPublicidad="1" AND t.idUsuario=g.idUsuario; #Reemplazaar "1" por el id de publicidad deseado

#5 cantidad de torneos en competencia por cada deporte
select d.nombre, count(*)
from torneos as t, deportes as d
where t.fechaFinalizado >= curdate() AND d.idDeporte= t.idDeporte  #Curdate=fecha actual del sisteaa
group by (d.nombre);

#6 Alineaciones de un encuentro dado
select j.nombre, j.apellido, a.Poscion, equi.Nombre as Equipo
from Jugador as j, Alineacion as a, Encuentros as e, Utiliza as u, Equipos as equi, Forman as f
where a.idAlineacion=u.idAlineacion AND u.idEncuentro = e.idEncuentro AND e.idEncuentro=1 AND j.idJugador=a.idJugador AND equi.idEquipo=f.idEquipo AND f.idJugador=j.idJugador ;


#Equipos que practican deporte
select e.nombre from Practican as p, Equipos as e, Deportes as d where p.idEquipo=e.idEquipo AND d.idDeporte=p.idDeporte AND d.idDeporte = "1";

#Encuentros que no estan en ningun torneo
select e.descripcionEncuentro, e.fechaComienzo 
from Encuentros as e 
where e.idEncuentro not in (select idEncuentro from torneosTienenEncuentros as t);

#Encuentros que estan en un determinado torneo
select e.idEncuentro, e.descripcionEncuentro 
from Encuentros as e 
where e.idEncuentro in (select idEncuentro from torneosTienenEncuentros as t where idTorneo=4);
select * from Genera;

#Resultado con Puntos de un evento dado
select e.nombre, e.categoria, p.puntos 
from Equipos as e, Genera as g, Puntos as p 
where g.idResultado=p.idResultado AND g.idEncuentro=2 AND p.idEquipo=e.idEquipo;

#Resultado con Rankings
	select e.nombre, e.categoria, r.puntuacion 
    from Equipos as e, Genera as g, Rankings as r 
    where g.idResultado=r.idResultado AND g.idEncuentro=2 AND r.idEquipo=e.idEquipo order by r.puntuacion desc;

#Resultado con Sets
select e.nombre, e.categoria, p.setsGanados
 from Equipos as e, Genera as g, Particular as p
 where g.idResultado=p.idResultado AND g.idEncuentro=2 AND p.idEquipo=e.idEquipo ;

#encuentros de un torneo dado
select e.idEncuentro, e.descripcionEncuentro, e.fechaComienzo from Torneos as t, torneosTienenEncuentros as tt, Encuentros as e where t.idTorneo = tt.idTorneo AND tt.idEncuentro=e.idEncuentro AND t.idTorneo= 8;
select * from Torneos;
#datos de un torneo dado

#datos de un torneo dado
select distinct t.fechaComienzo, t.fechaFinalizado, d.nombre, equi.nombre, equi.categoria 
from Torneos as t, equipos as equi, deportes as d, torneosTienenEncuentros as tt
where t.idTorneo=tt.idTorneo AND tt.idEquipo = equi.idEquipo AND tt.idDeporteTorneo = d.idDeporte AND t.idTorneo=35;
