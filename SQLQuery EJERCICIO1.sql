CREATE DATABASE EJERCICIO1
use EJERCICIO1

CREATE TABLE Empleado(
nombre_empleado Nvarchar(50) PRIMARY KEY,
calle nvarchar(10),
ciudad nvarchar(10))

alter table empleado
alter column calle nvarchar(25);

CREATE TABLE Trabaja(
nombre_empleado Nvarchar(25) not null,
nombre_empresa Nvarchar(25) not null,
sueldo money)

CREATE TABLE Empresa(
nombre_empresa Nvarchar(25) PRIMARY KEY,
ciudad nvarchar(25))

CREATE TABLE Jefe(
nombre_empleado Nvarchar(50) PRIMARY KEY,
nombre_jefe nvarchar(25))

ALTER TABLE Trabaja
ADD CONSTRAINT empleado_empresa PRIMARY KEY CLUSTERED (nombre_empleado,nombre_empresa)

ALTER TABLE Empleado
ADD CONSTRAINT ck_ciudad CHECK (ciudad IN ('medellin','bogota','cali'))

ALTER TABLE Trabaja
ADD id int IDENTITY (1,1)

ALTER TABLE Empleado
ADD id int IDENTITY (1,1)


ALTER TABLE Empleado ALTER COLUMN calle nvarchar(10) not null

INSERT INTO Empleado(nombre_empleado,calle,ciudad)
values('Juan Pérez','Av.Principal 123','Medellin'),
	  ('María López','Calle Alegre 45','Bogota'),
	  ('Carlos Garçía','Av. Libertador 789','Cali'),
	  ('Andres López','Calle 16 a','Medellin');

INSERT INTO Empresa(nombre_empresa,ciudad)
values('Tech Solutions','Medellín'),
      ('BigCorp','Bogotá'),
	  ('SoftwareCo','Cali');

INSERT INTO Jefe(nombre_empleado,nombre_jefe)
values('Juan Pérez','Carlos Garçía'),
      ('María López','Carlos Garçía'),
	  ('Andres López','Juan Pérez');

INSERT INTO Trabaja(nombre_empleado,nombre_empresa,sueldo)
VALUES('Juan Pérez','Tech Solutions',3000),
      ('María López','BigCorp',3200),
	  ('Carlos Garçía','SoftwareCo',4000),
	  ('Andres López','SoftwareCo',3800);



SELECT * FROM  JEFE 
SELECT * FROM  EMPRESA
SELECT * FROM  EMPLEADO
SELECT * FROM  TRABAJA




SELECT * FROM Empleado

select top(1) nombre_empleado
from trabaja 
order by sueldo desc;

--punto 1
SELECT COUNT(DISTINCT ciudad) AS cantidad_de_ciudades
FROM empleado;

Select * from Empleado order by id asc;
--punto 2
SELECT top 2 *
FROM empleado
WHERE ciudad = 'medellin'

select * from trabaja
--punto 3
SELECT nombre_empleado,sueldo AS salario_anterior, sueldo * 1.10 AS 'aumentoal10%'
FROM trabaja

--punto 4
SELECT nombre_empleado, sueldo AS salario_anterior,sueldo * 1.10 AS aumento_al_10,(sueldo + (sueldo*1.10)) AS suma_salarios
FROM trabaja;

select * from trabaja

--punto 5 
SELECT TOP 1 nombre_empleado,sueldo
FROM trabaja
ORDER BY sueldo desc;

--punto 6
SELECT TOP 1 nombre_empleado,sueldo 
FROM trabaja 


--LISTAR EMPLEADOS CON ROL DE JEFE
Select DISTINCT(nombre_jefe) from JEFE 

--EMPRESAS QUE PAGUEN ENTRE 3200 Y 4000
SELECT DISTINCT nombre_empresa FROM Trabaja where sueldo between 3200 and 4000

--EMPLEADOS QUE RESIDEN YA SEA EN MEDELLIN , BOGOTA O CALI
select nombre_empleado from Empleado where ciudad in('medellin','bogota','cali')

--EMPLEADOS QUE RESIDEN EN MEDELLIN Y EL JEFE ES JUAN PEREZ
select Empleado.*
from Empleado
join jefe on Empleado.nombre_empleado = Jefe.nombre_empleado
where ciudad='medellin' and nombre_jefe='Juan Pérez'
						
--Empleado que tienen el apellido López 
SELECT nombre_empleado
FROM empleado
WHERE nombre_empleado LIKE '%López';

--Empleado cuyo nombre empiece con A

Select nombre_empleado
from Empleado
where nombre_empleado like 'A%';

--Cual es la empresa que ofrece mejores salarios
SELECT nombre_empresa
FROM trabaja
WHERE sueldo = (SELECT MAX(sueldo) FROM trabaja);

--en que ciudad pagan los mejores salarios
select ciudad from empresa 
join trabaja on EMpresa.nombre_empresa=Trabaja.nombre_empresa
where Trabaja.sueldo=(SELECT MAX(sueldo) FROM trabaja);