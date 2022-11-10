DELIMITER $$
CREATE TRIGGER insertarenResulados
after INSERT ON Notifica
FOR EACH ROW
BEGIN
	if ('gol' = (select distinct o.nombre from Ocurrencias as o, hacen as h where o.idOcurrencia=h.idOcurrencia AND o.idOcurrencia = new.idOcurrencia AND h.idIncidencia=new.idIncidencia)) then 		
       if ((select count(g.idResultado) from Genera as g, puntos as p where g.idEncuentro=new.idEncuentro AND p.idResultado=g.idResultado and p.idEquipo = (select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo)) = 0) then
			insert into Resultados() values ();
			update Incidencias set puntos=1 where idIncidencia=new.idIncidencia;
            insert into Genera (idResultado, idEncuentro, idDeporte) values ((select max(idResultado) from Resultados),(new.idEncuentro), new.idDeporte);
			insert into Puntos (idResultado, puntos, idEquipo) values ((select max(idResultado) from Resultados), (select count(o.nombre) from Ocurrencias as o, hacen as h where o.idOcurrencia=h.idOcurrencia AND o.idOcurrencia =new.idOcurrencia AND h.idIncidencia=new.idIncidencia AND o.nombre='gol'), (select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo) );        
		else # ya habia hecho algun punto y figura 
			update Puntos set Puntos = puntos+1 where idResultado=(select p.idResultado from Puntos as p, Genera as g where p.idResultado=g.idResultado AND g.idEncuentro = new.idEncuentro AND p.idEquipo=(select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo));
		end if; 	#del segundo IF
    
	elseif ('gana set' = (select distinct o.nombre from Ocurrencias as o, hacen as h where o.idOcurrencia=h.idOcurrencia AND o.idOcurrencia = new.idOcurrencia AND h.idIncidencia=new.idIncidencia)) then #si fue sets
		if ((select count(g.idResultado) from Genera as g, Particular as p where g.idEncuentro=new.idEncuentro AND p.idResultado=g.idResultado and p.idEquipo = (select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo)) = 0) then
			insert into Resultados() values ();
            update Incidencias set puntos=0 where idIncidencia=new.idIncidencia;
            insert into Genera (idResultado, idEncuentro, idDeporte) values ((select max(idResultado) from Resultados),(new.idEncuentro), new.idDeporte);
			insert into Particular (idResultado, setsGanados, idEquipo) values ((select max(idResultado) from Resultados), (select count(o.nombre) from Ocurrencias as o, hacen as h where o.idOcurrencia=h.idOcurrencia AND o.idOcurrencia =new.idOcurrencia AND h.idIncidencia=new.idIncidencia AND o.nombre='gana set'), (select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo) );        
		else # ya habia hecho algun set y figura 
			update Particular set setsGanados = setsGanados+1 where idResultado=(select p.idResultado from Particular as p, Genera as g where p.idResultado=g.idResultado AND g.idEncuentro = new.idEncuentro AND p.idEquipo=(select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo));    
		
        end if;	
   elseif ('Puntaje en el ranking' = (select distinct o.nombre from Ocurrencias as o, hacen as h where o.idOcurrencia=h.idOcurrencia AND o.idOcurrencia = new.idOcurrencia AND h.idIncidencia=new.idIncidencia)) then #si fue en rankings
		if ((select count(g.idResultado) from Genera as g, Rankings as p where g.idEncuentro=new.idEncuentro AND p.idResultado=g.idResultado and p.idEquipo = (select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo)) = 0) then
			insert into Resultados() values ();
            insert into Genera (idResultado, idEncuentro, idDeporte) values ((select max(idResultado) from Resultados),(new.idEncuentro), new.idDeporte);
			insert into Rankings (idResultado, puntuacion, idEquipo) values ((select max(idResultado) from Resultados), (select puntos from Incidencias as i where i.idIncidencia =new.idIncidencia), (select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo) );        
		else # ya habia hecho algun set y figura 
			update Rankings set puntuacion = (select puntos from Incidencias as i where i.idIncidencia =new.idIncidencia) where idResultado=(select p.idResultado from Rankings as p, Genera as g where p.idResultado=g.idResultado AND g.idEncuentro = new.idEncuentro AND p.idEquipo=(select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo));    
        end if; 
    elseif ("sumar puntos" = (select distinct o.nombre from Ocurrencias as o, hacen as h where o.idOcurrencia=h.idOcurrencia AND o.idOcurrencia = new.idOcurrencia AND h.idIncidencia=new.idIncidencia)) then #si se quiere sumar/restar x cantidad
		if ((select count(g.idResultado) from Genera as g, Puntos as p where g.idEncuentro=new.idEncuentro AND p.idResultado=g.idResultado and p.idEquipo = (select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo)) = 0) then
			insert into Resultados() values ();
            insert into Genera (idResultado, idEncuentro, idDeporte) values ((select max(idResultado) from Resultados),(new.idEncuentro), new.idDeporte);
			insert into Puntos (idResultado, puntos, idEquipo) values ((select max(idResultado) from Resultados), ((select puntos from Incidencias as i where i.idIncidencia =new.idIncidencia)), (select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo) );        
		else # 
			update Puntos set puntos = puntos+((select puntos from Incidencias as i where i.idIncidencia =new.idIncidencia)) where idResultado=(select p.idResultado from Puntos as p, Genera as g where p.idResultado=g.idResultado AND g.idEncuentro = new.idEncuentro AND p.idEquipo=(select equi.idEquipo from Equipos as equi, forman as f where f.idJugador=(select idJugador from Incidencias where idIncidencia= new.idIncidencia) AND f.idEquipo=equi.idEquipo));    
		
        end if;	
    end if; 	#del primer if
	
END;$$
Delimiter ;
#drop trigger insertarenResulados;
