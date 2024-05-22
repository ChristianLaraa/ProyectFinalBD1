create database Candidatos;
use Candidatos;

create table partido_politico(
id_partido int not null primary key auto_increment,
nombre varchar(30) not null unique,
telefono int not null unique,
email varchar(100) not null unique
);

create table coalicion(
id_coalicion int not null primary key auto_increment,
id_partido int ,
nombre varchar(30) not null unique,

foreign key (id_partido) references partido_politico(id_partido)
);

create table militancia(
id_militancia int not null primary key auto_increment,
nombre varchar(30) not null unique
);

create table presidente(
id_presidente int primary key
);
create table gobernador(
id_gobernador int primary key
);
create table diputado(
id_diputado int primary key
);

create table senador(
id_senador int primary key
);

create table presidente_municipal(
id_presidenteMunicipal int primary key
);

create table cargo(
id_cargo int not null primary key unique,
id_presidente int,
id_gobernador int,
id_diputado int,
id_senador int,
id_presidenteMunicipal int,

foreign key (id_presidente) references presidente(id_presidente),
foreign key (id_gobernador) references gobernador(id_gobernador),
foreign key (id_diputado) references diputado(id_diputado),
foreign key (id_senador) references senador(id_senador),
foreign key (id_presidenteMunicipal) references presidente_municipal(id_presidenteMunicipal)
);

create table historial(
id_historial int not null primary key auto_increment,
cargo_solicitado varchar(70) not null,
resultado varchar(30) not null,
fecha_eleccion date not null
);

create table documentacion(
id_documentacion int not null primary key auto_increment, 
documento varchar(50) not null,
verificacion_eligibilidad varchar(50) not null,
declaracion_interes varchar(50) not null
);

create table distritos(
id_distrito int not null primary key auto_increment,
nombre varchar(70) not null unique,
num_habitantes int ,
num_electores int 
);

create table municipios(
id_municipio int not null primary key auto_increment,
nombre varchar(70) not null unique,
num_habitantes int,
num_electores int
);

create table estados(
id_estado int not null primary key auto_increment,
nombre varchar(30) not null unique,
numero_habitantes int,
numero_electores int,
id_distrito int,
id_municipio int,

foreign key(id_distrito) references distritos(id_distrito),
foreign key(id_municipio) references municipios(id_municipio) 
);

create table demarcacion(
id_demarcacion int not null primary key auto_increment,
id_estado int,

foreign key (id_estado)	references estados(id_estado)
);

create table candidato(
id_candidato int not null primary key auto_increment,
rfc varchar(13) not null unique,
nombre varchar(50) not null,
ap_paterno varchar(50) not null,
ap_materno varchar(50) not null,
fenac date not null,
direccion varchar(150) not null,
telefono int  not null unique,
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
foreign key(id_partido) references partido_politico(id_partido) ,
foreign key(id_coalicion) references coalicion(id_coalicion), 
foreign key(id_militancia) references militancia(id_militancia), 
foreign key(id_cargo) references cargo(id_cargo),
foreign key(id_demarcacion) references demarcacion(id_demarcacion),
foreign key(id_historial) references historial(id_historial),
foreign key(id_documentacion) references documentacion(id_documentacion)

);

create table bitacora(
id int not null auto_increment primary key,
fecha datetime not null,
usuario varchar(50) not null,
tabla varchar(50) not null,
accion text null
);

select * from bitacora;

desc candidato;



