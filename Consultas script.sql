use candidatos;

-- queremos obtener información sobre los candidatos y sus afiliaciones partidarias
SELECT c.nombre, c.ap_paterno, c.ap_materno, p.nombre AS partido, co.nombre AS coalicion
FROM candidato c
LEFT JOIN partido_politico p ON c.id_partido = p.id_partido
LEFT JOIN coalicion co ON c.id_coalicion = co.id_coalicion;

-- muestra los candidatos que no tienen un partido político asignado.
SELECT nombre, ap_paterno, ap_materno
FROM candidato
WHERE id_partido IS NULL;

-- Muestra el número de candidatos por partido político
SELECT p.nombre AS partido, COUNT(c.id_candidato) AS total_candidatos
FROM partido_politico p
LEFT JOIN candidato c ON p.id_partido = c.id_partido
GROUP BY p.nombre;

-- Esta consulta une la tabla candidato con la tabla partido_politico para obtener información sobre el partido político al que está afiliado cada candidato.
SELECT c.nombre, c.ap_paterno, p.nombre AS partido
FROM candidato c
INNER JOIN partido_politico p ON c.id_partido = p.id_partido;

-- Lista los municipios que no tienen un distrito asociado 
SELECT m.nombre AS municipio
FROM municipios m
LEFT JOIN distritos d ON m.id_estado = d.id_estado
WHERE d.id_distrito IS NULL;

-- Mostrar los 5 estados que tienen el mayor número de habitantes 
SELECT nombre AS estado
FROM estados
ORDER BY numero_habitantes DESC LIMIT 5;

-- Mostrar la información de los candidatos 
CREATE VIEW vista_candidatos AS
SELECT id_candidato, nombre, ap_paterno, ap_materno
FROM candidato;

SELECT * FROM vista_candidatos;

-- Mostrar la información del candidato junto con el partido asociado
CREATE VIEW vista_candidatos_partidos AS
SELECT c.nombre, c.ap_paterno, c.ap_materno, p.nombre AS partido
FROM candidato c
INNER JOIN partido_politico p ON c.id_partido = p.id_partido;

SELECT * FROM vista_candidatos_partidos;

-- Mostrar a los candidatos que pertenezcan al partido politico cuyo id_partido sea igual a 1
CREATE VIEW vista_candidatos_filtrados AS
SELECT id_candidato, nombre, ap_paterno, ap_materno
FROM candidato
WHERE id_partido = 1; -- Filtro por partido político específico

SELECT * FROM vista_candidatos_filtrados;

-- Mostrar el número de candidatos por el id de cada partido
CREATE VIEW vista_candidatos_por_partido AS
SELECT id_partido, COUNT(*) AS total_candidatos
FROM candidato
GROUP BY id_partido;

SELECT * FROM vista_candidatos_por_partido;

-- Mostrar todos los datos que tiene la tabla candidatos mediante una vista
CREATE VIEW vista_candidatos_ordenados AS
SELECT *
FROM candidato
ORDER BY ap_paterno, ap_materno, nombre;

SELECT * FROM vista_candidatos_ordenados;

-- Mostrar a los candidatos con su respectivo partido político no mostrando su id 
CREATE VIEW vista_candidatos_con_partidos AS
SELECT id_candidato, nombre, ap_paterno, ap_materno,
       (SELECT nombre FROM partido_politico WHERE id_partido = candidato.id_partido) AS partido
FROM candidato;

SELECT * FROM vista_candidatos_con_partidos;

-- Mostrar al candidato con su partido y coalicion 
CREATE VIEW vista_candidatos_completos AS
SELECT c.nombre, c.ap_paterno, c.ap_materno, p.nombre AS partido, co.nombre AS coalicion
FROM candidato c
LEFT JOIN partido_politico p ON c.id_partido = p.id_partido
LEFT JOIN coalicion co ON c.id_coalicion = co.id_coalicion;

SELECT * FROM vista_candidatos_completos;

-- Calcular la edad del candidato mediante la fecha registrada 
CREATE VIEW vista_candidatos_edad AS
SELECT nombre, ap_paterno, ap_materno, fnac, YEAR(CURDATE()) - YEAR(fnac) AS edad
FROM candidato;

SELECT * FROM vista_candidatos_edad;

-- Estados que tengan mas de 10000
SELECT nombre FROM estados
UNION
SELECT nombre FROM municipios WHERE num_habitantes > 10000;

-- Mostrar todos los candidatos que sean de la Ciudad de Mexico 
SELECT *
FROM candidato
WHERE direccion = 'Mexico City';

-- Vista que muestra los datos del candidato mas el estado 
DROP VIEW IF EXISTS vista_candidatos_por_estado;
CREATE VIEW vista_candidatos_por_estado AS
SELECT c.id_candidato 'Id', c.nombre 'Nombre', c.ap_paterno'Apellido Paterno', c.ap_materno'Apellido Materno', 
e.nombre 'Estado',c.fnac 'Fecha de Nacimiento', c.telefono, c.email
FROM candidato c
LEFT JOIN demarcacion d ON c.id_demarcacion = d.id_demarcacion
LEFT JOIN estados e ON d.id_estado = e.id_estado;

SELECT * FROM vista_candidatos_por_estado;

-- Vista que muestra los datos del candidato mas el cargo solicitado
DROP VIEW IF EXISTS vista_candidatos_por_cargo_solicitado;
CREATE VIEW vista_candidatos_por_cargo_solicitado AS
SELECT c.id_candidato 'id',c.nombre 'Nombre',c.ap_paterno 'Apellido Paterno',c.ap_materno 'Apellido Materno',
h.cargo_solicitado 'Cargo Solicitado',c.fnac 'Fecha de Nacimiento',c.telefono,c.email
FROM candidato c
LEFT JOIN historial h ON c.id_historial = h.id_historial;

SELECT * FROM vista_candidatos_por_cargo_solicitado;

-- Vista que muestra la informacion mas la documentacion del candidato
DROP VIEW IF EXISTS vista_documentacion_candidatos;
CREATE VIEW vista_documentacion_candidatos AS
SELECT c.id_candidato 'Id',c.nombre 'Nombre',c.ap_paterno'Apellido Paterno',c.ap_materno'Apellido Materno', 
doc.documento 'Documento',doc.verificacion_eligibilidad 'Verificacion',doc.declaracion_interes 'Declaracion'
FROM candidato c
LEFT JOIN documentacion doc ON c.id_documentacion = doc.id_documentacion;

SELECT * FROM vista_documentacion_candidatos;

-- Vista que muestra toda la informacion detallada del candidato
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

SELECT * FROM vista_candidatos_detallada;
