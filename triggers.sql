use candidatos;
-- verifica que el no haya un duplicado (before insert)
DELIMITER //
drop trigger if exists bi_candidato //
CREATE TRIGGER bi_candidato
BEFORE INSERT ON candidato
FOR EACH ROW
BEGIN
    DECLARE candidato_existente INT;
    SELECT COUNT(*) INTO candidato_existente
    FROM candidato
    WHERE nombre = NEW.nombre
      AND ap_paterno = NEW.ap_paterno
      AND ap_materno = NEW.ap_materno;
    IF candidato_existente > 0 THEN
        INSERT INTO bitacora VALUES (null, sysdate(), user(),'CANDIDATO', CONCAT('Intento de inserción de candidato duplicado: ', NEW.nombre, ' ', NEW.ap_paterno, ' ', NEW.ap_materno));
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El candidato ya existe.';
    END IF;
END//
DELIMITER ;


-- muestra que candidato se agrego (after insert)
DELIMITER //
DROP TRIGGER IF EXISTS ai_candidato //
CREATE TRIGGER ai_candidato
AFTER INSERT ON candidato
FOR EACH ROW
BEGIN
    INSERT INTO bitacora VALUES (null, sysdate(), user(),'CANDIDATO', CONCAT('Se agregó un nuevo candidato: ', NEW.nombre, ' ', NEW.ap_paterno, ' ', NEW.ap_materno));
END//
DELIMITER ;

-- muestra despues de borrar (after delete)
DELIMITER // 
DROP trigger IF exists ad_candidato // 
 create trigger ad_candidato
 after delete on candidato 
 for each row 
 begin
    insert into bitacora values(null, sysdate(), user(), 'CANDIDATOS',
    json_object('accion', 'ELIMINACION', 'id_candidato', old.id_candidato,'rfc', old.rfc, 
		'nombre', old.nombre, 'ap_paterno', old.ap_paterno,'ap_materno', old.ap_materno, 'fecha de nacimiento', old.fenac, 'telefono', old.telefono,  
        'propuestas', old.propuestas, 'fecha de inscripción', old.finscrip,
        'direccion', old.direccion, 'email', old.email, 'id_partido', old.id_partido,
        'id_coalicion', old.id_coalicion, 'id_militancia', old.id_militancia, 
        'id_cargo', old.id_cargo, 'id_demarcacion', old.id_demarcacion,
        'id_historial', old.id_historial, 'id_documentacion', old.id_documentacion 
    ));
 END //
 DELIMITER ;
 
 -- verifica que no tenga mas de un partido
DELIMITER //
DROP TRIGGER IF EXISTS bi_maspartidos //
CREATE TRIGGER bi_partidos
BEFORE INSERT ON candidato
FOR EACH ROW
BEGIN
    DECLARE partido_existente INT;
    SELECT COUNT(*) INTO partido_existente
    FROM candidato
    WHERE id_partido IS NOT NULL
    AND id_candidato = NEW.id_candidato;
    IF partido_existente > 0 THEN
        INSERT INTO bitacora VALUES (null, sysdate(), user(), 'CANDIDATOS', CONCAT('Intento de asignar más de un partido al candidato ', NEW.id_candidato));
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El candidato ya pertenece a un partido político.';
    END IF;
END //
DELIMITER ;

-- verifica que no tenga mas de una coalicion
DELIMITER //
DROP TRIGGER IF EXISTS bi_mascoalicion //
CREATE TRIGGER bi_mascoalicion
BEFORE INSERT ON candidato
FOR EACH ROW
BEGIN
    DECLARE coalicion_existente INT;
    SELECT COUNT(*) INTO coalicion_existente
    FROM candidato
    WHERE id_coalicion IS NOT NULL
    AND id_candidato = NEW.id_candidato;
    IF coalicion_existente > 0 THEN
        INSERT INTO bitacora VALUES (null, sysdate(), user(), 'CANDIDATOS', CONCAT('Intento de asignar más de una coalición al candidato ', NEW.id_candidato));
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El candidato ya pertenece a una coalición.';
    END IF;
END //
DELIMITER ;

-- verifica que el candidato no tenga mas de un cargo
DELIMITER //
DROP TRIGGER IF EXISTS bi_mascargo //
CREATE TRIGGER bi_mascargo
BEFORE INSERT ON candidato
FOR EACH ROW
BEGIN
    DECLARE cargo_existente INT;
    SELECT COUNT(*) INTO cargo_existente
    FROM candidato
    WHERE id_cargo IS NOT NULL
    AND id_candidato = NEW.id_candidato;
    IF cargo_existente > 0 THEN
        INSERT INTO bitacora VALUES (null, sysdate(), user(), 'CANDIDATOS', CONCAT('Intento de asignar más de un cargo al candidato ', NEW.id_candidato));
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El candidato ya tiene asignado un cargo.';
    END IF;
END //
DELIMITER ;

select *
from INFORMATION_SCHEMA.TRIGGERS
WHERE event_object_schema = 'candidatos';