create database Candidatos;
use Candidatos;

create table partido_politico(
id_partido int not null primary key auto_increment,
nombre varchar(200) not null unique,
abreviatura varchar(10),
telefono varchar(15) not null unique,
email varchar(100) not null unique
);

create table coalicion(
id_coalicion int not null primary key auto_increment,
id_partido int ,
id_partido2 int,
id_partido3 int,
nombre varchar(30) not null unique,

foreign key (id_partido) references partido_politico(id_partido)  on delete cascade on update cascade,
FOREIGN KEY (id_partido2) REFERENCES partido_politico(id_partido) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_partido3) REFERENCES partido_politico(id_partido) ON DELETE CASCADE ON UPDATE CASCADE
);

create table militancia(
id_militancia int not null primary key auto_increment,
nombre varchar(30) not null unique
);

create table cargo(
id_cargo int not null primary key auto_increment,
nombre_cargo varchar(50));

create table historial(
id_historial int not null primary key auto_increment,
cargo_solicitado varchar(70) not null,
resultado varchar(30) not null,
fecha_eleccion date not null
);

create table documentacion(
id_documentacion int not null primary key auto_increment, 
documento text not null,
verificacion_eligibilidad varchar(50) not null,
declaracion_interes text not null
);

create table distritos(
id_distrito int not null primary key auto_increment,
nombre varchar(70) not null unique,
num_habitantes int ,
num_electores int,
id_estado int,

FOREIGN KEY (id_estado) REFERENCES estados(id_estado) ON DELETE CASCADE ON UPDATE CASCADE
);

create table municipios(
id_municipio int not null primary key auto_increment,
nombre varchar(70) not null unique,
num_habitantes int,
num_electores int,
id_estado int,

FOREIGN KEY (id_estado) REFERENCES estados(id_estado) ON DELETE CASCADE ON UPDATE CASCADE
);

create table estados(
id_estado int not null primary key auto_increment,
nombre varchar(30) not null unique,
numero_habitantes int,
numero_electores int
);

create table demarcacion(
id_demarcacion int not null primary key auto_increment,
id_estado int,
id_municipio_o_estado int,

FOREIGN KEY (id_estado) REFERENCES estados(id_estado) ON DELETE CASCADE ON UPDATE CASCADE
);

create table candidato(
id_candidato int not null primary key auto_increment,
rfc varchar(13) not null unique,
nombre varchar(50) not null,
ap_paterno varchar(50) not null,
ap_materno varchar(50) not null,
fnac date not null,
direccion varchar(150) not null,
telefono varchar(15)  not null unique,
email varchar(100) not null unique,
propuestas text not null,
finscrip date not null,
id_partido int,
id_coalicion int,
id_militancia int,
id_cargo int,
id_demarcacion int,
id_historial int,
id_documentacion int,

UNIQUE KEY uk_nombre (nombre, ap_paterno, ap_materno),
FOREIGN KEY (id_partido) REFERENCES partido_politico(id_partido) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (id_coalicion) REFERENCES coalicion(id_coalicion) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (id_militancia) REFERENCES militancia(id_militancia) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (id_demarcacion) REFERENCES demarcacion(id_demarcacion) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (id_historial) REFERENCES historial(id_historial) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (id_documentacion) REFERENCES documentacion(id_documentacion) ON DELETE CASCADE ON UPDATE CASCADE
);

create table bitacora(
id int not null auto_increment primary key,
fecha datetime not null,
usuario varchar(50) not null,
tabla varchar(50) not null,
accion text null
);



-- TRIGGERS

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



-- VISTAS

DROP VIEW IF EXISTS vista_candidatos_por_estado;
CREATE VIEW vista_candidatos_por_estado AS
SELECT c.id_candidato 'Id', c.nombre 'Nombre', c.ap_paterno'Apellido Paterno', c.ap_materno'Apellido Materno', 
e.nombre 'Estado',c.fnac 'Fecha de Nacimiento', c.telefono, c.email
FROM candidato c
LEFT JOIN demarcacion d ON c.id_demarcacion = d.id_demarcacion
LEFT JOIN estados e ON d.id_estado = e.id_estado;

DROP VIEW IF EXISTS vista_candidatos_por_cargo_solicitado;
CREATE VIEW vista_candidatos_por_cargo_solicitado AS
SELECT c.id_candidato 'id',c.nombre 'Nombre',c.ap_paterno 'Apellido Paterno',c.ap_materno 'Apellido Materno',
h.cargo_solicitado 'Cargo Solicitado',c.fnac 'Fecha de Nacimiento',c.telefono,c.email
FROM candidato c
LEFT JOIN historial h ON c.id_historial = h.id_historial;

DROP VIEW IF EXISTS vista_documentacion_candidatos;
CREATE VIEW vista_documentacion_candidatos AS
SELECT c.id_candidato 'Id',c.nombre 'Nombre',c.ap_paterno'Apellido Paterno',c.ap_materno'Apellido Materno', 
doc.documento 'Documento',doc.verificacion_eligibilidad 'Verificacion',doc.declaracion_interes 'Declaracion'
FROM candidato c
LEFT JOIN documentacion doc ON c.id_documentacion = doc.id_documentacion;

DROP VIEW IF EXISTS vista_candidatos_detallada;
CREATE VIEW vista_candidatos_detallada AS
SELECT c.id_candidato 'Id',c.rfc 'RFC',concat(c.nombre,' ',c.ap_paterno ,' ',c.ap_materno ) 'Nombre Completo',
c.fnac 'Fecha de Nacimiento',c.direccion 'Direccion',c.telefono 'Telefono',c.email 'Email',c.propuestas 'Propuestas',
c.finscrip 'Fecha Inscripcion',p.nombre 'Partido Politico',co.nombre 'Coalicion',m.nombre 'Militancia',
ca.nombre_cargo 'Cargo',e.nombre 'Estado',d.id_municipio_o_estado 'Munipio o distrito',h.cargo_solicitado 'Cargo Solicitado Anteriormente',
h.resultado 'Resultado',h.fecha_eleccion 'Fecha de Eleccion',doc.documento 'Documento',doc.verificacion_eligibilidad 'Verificación',
doc.declaracion_interes 'Declaracion de Interes'
FROM candidato c
LEFT JOIN partido_politico p ON c.id_partido = p.id_partido
LEFT JOIN coalicion co ON c.id_coalicion = co.id_coalicion
LEFT JOIN militancia m ON c.id_militancia = m.id_militancia
LEFT JOIN cargo ca ON c.id_cargo = ca.id_cargo
LEFT JOIN demarcacion d ON c.id_demarcacion = d.id_demarcacion
LEFT JOIN estados e ON d.id_estado = e.id_estado
LEFT JOIN historial h ON c.id_historial = h.id_historial
LEFT JOIN documentacion doc ON c.id_documentacion = doc.id_documentacion;


desc candidatos;
USE Candidatos;

