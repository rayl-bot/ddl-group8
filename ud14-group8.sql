#EJERCICIO 3 TIENDA DE INFORMATICA
CREATE DATABASE IF NOT EXISTS informatica;

USE informatica;

CREATE table IF NOT EXISTS fabricantes(
cod_fabri int NOT NULL,
nombre char(100),
PRIMARY KEY(cod_fabri));

CREATE table IF NOT EXISTS articulos(
cod_art int NOT NULL,
nombre char(100) NOT NULL,
precio int NOT NULL,
cod_fabri int NOT NULL,
FOREIGN KEY(cod_fabri) REFERENCES fabricantes(cod_fabri),
PRIMARY KEY(cod_art));

#EJERCICIO 4 EMPLEADOS
CREATE DATABASE IF NOT EXISTS empresa;

USE empresa;

CREATE table IF NOT EXISTS departamentos(
cod_depart int NOT NULL,
nombre char(100) NOT NULL,
presupuesto int NOT NULL,
PRIMARY KEY(cod_depart));

CREATE table IF NOT EXISTS empleados(
DNI char(8) NOT NULL,
nombre char(100) NOT NULL,
apellidos char(255) NOT NULL,
cod_depart int NOT NULL,
FOREIGN KEY(cod_depart) REFERENCES departamentos(cod_depart),
PRIMARY KEY(DNI));

#EJERCICIO 5: LOS ALMACENES
CREATE DATABASE IF NOT EXISTS almacenes;

USE almacenes;

CREATE TABLE IF NOT EXISTS almacenes(
cod_alma int NOT NULL,
lugar char(100) NOT NULL,
capacidad int NOT NULL,
PRIMARY KEY(cod_alma));

CREATE TABLE IF NOT EXISTS cajas(
n_ref char(5) NOT NULL,
contenido char(100) NOT NULL,
valor int NOT NULL,
cod_alma int NOT NULL,
FOREIGN KEY(cod_alma) REFERENCES almacenes(cod_alma),
primary key(n_ref));

#EJERCICIO 6: PELICULAS Y SALAS
CREATE DATABASE IF NOT EXISTS cine;

USE cine;

CREATE TABLE IF NOT EXISTS peliculas(
cod_peli int,
nombre char(100) NOT NULL,
cal_edad int NOT NULL,
PRIMARY KEY(cod_peli));


CREATE TABLE IF NOT EXISTS salas(
cod_sala int NOT NULL,
nombre char(100) NOT NULL,
cod_peli int,
foreign key(cod_peli) REFERENCES peliculas(cod_peli),
PRIMARY KEY(cod_sala));

#EJERCICIO 7: LOS DIRECTORES
CREATE DATABASE IF NOT EXISTS direccion;

USE direccion;

CREATE TABLE IF NOT EXISTS despachos(
num int NOT NULL,
capacidad int NOT NULL,
primary key(num));

CREATE TABLE IF NOT EXISTS directores(
DNI char(8) NOT NULL,
nombre_apels char(255),
num_desp int NOT NULL,
DNI_fk char(8) NOT NULL,
foreign key (DNI_fk) REFERENCES directores(DNI),
foreign key (num_desp) REFERENCES despachos(num),
primary key(DNI));

#EJERCICIO 8: PIEZAS Y PROVEEDORES
CREATE DATABASE IF NOT EXISTS almacenes2;

USE almacenes2;

CREATE TABLE IF NOT EXISTS piezas(
cod int NOT NULL,
nombre char(100),
primary key(cod));

CREATE TABLE IF NOT EXISTS proveedores(
id char(4) NOT NULL,
nombre char(100) NOT NULL,
primary key(id));

CREATE TABLE IF NOT EXISTS suministra(
cod_pieza int NOT NULL,
id_prove char(4) NOT NULL,
foreign key (cod_pieza) REFERENCES piezas(cod),
foreign key (id_prove)  REFERENCES proveedores(id),
precio int NOT NULL,
PRIMARY KEY(cod_pieza,id_prove));

#EJERCICIO 9: LOS CIENTIFICOS
CREATE DATABASE IF NOT EXISTS laboratorio;

USE laboratorio;

CREATE TABLE IF NOT EXISTS cientificos(
DNI char(8) NOT NULL,
nom_apels char(255) NOT NULL,
primary key(DNI));

CREATE TABLE IF NOT EXISTS proyecto(
id char(4) NOT NULL,
nombre char(255) NOT NULL,
horas int,
primary key(id));

CREATE TABLE IF NOT EXISTS asignado_a(
dni_cien char(8) NOT NULL,
proyecto char(4) NOT NULL,
foreign key(dni_cien) REFERENCES cientificos(DNI),
foreign key(proyecto) REFERENCES proyecto(id),
PRIMARY key(dni_cien,proyecto));

#EJERCICIO 10: GRANDES ALMACENES
CREATE DATABASE IF NOT EXISTS almacenes3;

USE almacenes3;

CREATE TABLE IF NOT EXISTS cajeros(
cod int NOT NULL,
nom_apels char(255) NOT NULL,
PRIMARY KEY(cod));

CREATE TABLE IF NOT EXISTS productos(
cod int NOT NULL,
nombre char(100) NOT NULL,
precio int NOT NULL,
primary key(cod));

CREATE TABLE IF NOT EXISTS maquinas_registradoras(
cod int NOT NULL,
piso int NOT NULL,
primary key(cod));

CREATE TABLE IF NOT EXISTS venta(
cajero int NOT NULL,
maquina int NOT NULL,
producto int NOT NULL,
foreign key(cajero) REFERENCES cajeros(cod),
foreign key(maquina) REFERENCES maquinas_registradoras(cod),
foreign key(producto) REFERENCES productos(cod),
primary key(cajero,maquina,producto));

#EJERCICIO 11: LOS INVESTIGADORES
CREATE DATABASE IF NOT EXISTS investigacion;

USE investigacion;

CREATE TABLE IF NOT EXISTS facultad(
cod int NOT NULL,
nombre char(100) NOT NULL,
primary key(cod));

CREATE TABLE IF NOT EXISTS investigadores(
DNI char(8) NOT NULL,
nom_apels char(255)NOT NULL,
facultad int NOT NULL,
foreign key(facultad) REFERENCES facultad(cod),
primary key(DNI));

CREATE TABLE IF NOT EXISTS equipos(
num_serie char(4)NOT NULL,
nombre char(100)NOT NULL,
facultad int NOT NULL,
foreign key(facultad) REFERENCES facultad(cod),
primary key(num_serie));

CREATE TABLE IF NOT EXISTS reserva(
dni char(8) NOT NULL,
num_serie char(4)NOT NULL,
foreign key(dni) REFERENCES investigadores(DNI),
foreign key(num_serie) REFERENCES equipos(num_serie),
comienzo datetime NOT NULL,
fin datetime,
primary key(dni,num_serie));

#EJERCICIO 12: LA ACADEMIA
CREATE DATABASE IF NOT EXISTS academia;

USE academia;

CREATE TABLE IF NOT EXISTS profesores(
DNI char(8)NOT NULL,
nombre char(100)NOT NULL UNIQUE,
titulacion char(100)NOT NULL,
direccion char(255)NOT NULL,
cuota_horas int NOT NULL,
primary key(DNI));

CREATE TABLE IF NOT EXISTS curso(
cod int NOT NULL,
nombre char(100)NOT NULL UNIQUE,
max_alumn int NOT NULL,
d_ini datetime NOT NULL,
d_fin datetime NOT NULL,
num_horas int NOT NULL,
dni_prof char(4) NOT NULL,
check(d_ini<d_fin),
foreign key(dni_prof) REFERENCES profesores(DNI),
primary key(cod));

CREATE TABLE IF NOT EXISTS alumnos(
cod int NOT NULL,
nombre char(100)NOT NULL,
apellidos char(100)NOT NULL,
direccion char(255)NOT NULL,
d_nacimi datetime NOT NULL,
sexo char(1)NOT NULL,
cod_curs int NOT NULL,
check(sexo='M' or sexo='H' or sexo='O'),
foreign key(cod_curs) REFERENCES curso(cod),
primary key(cod));