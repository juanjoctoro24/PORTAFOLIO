CREATE DATABASE SUCURSALBANCARIA
USE SUCURSALBANCARIA

Create table Cliente(
NombreCliente nvarchar (30) primary key,
Direccion varchar (40) not null,
CiudadCliente varchar (40) 
);

Create table Cuenta(
NumeroCuenta varchar(20) primary key,
Saldo decimal(18,2) check (Saldo>0) not null,
);

Create table Impostor(
NombreCliente nvarchar(30),
NumeroCuenta varchar(20),
primary key (NombreCliente, NumeroCuenta),
foreign key (NombreCliente) references Cliente(NombreCliente),
foreign key (NumeroCuenta) references Cuenta(NumeroCuenta),
);

Create table Sucursal(
NombreSucursal nvarchar(30) primary key,
CiudadSucursal varchar (40),
Activos decimal(18,2) check (Activos>0) not null
);

ALTER TABLE Cuenta
add NombreSucursal nvarchar(30)

alter table Cuenta
add constraint Fk_Cuenta_Sucursal foreign key (NombreSucursal) references Sucursal(NombreSucursal)

insert into Cliente (NombreCliente,Direccion,CiudadCliente)
values('Pedro Ospina','calle 34 #45-23' , 'Medellin'),
	  ('Jhon Perez','Calle 23-#41-22','Bogotá');

insert into Cuenta (NumeroCuenta,Saldo,NombreSucursal)
values('19234339',45676453.22,'Drogueria el acetaminofen'),
	  ('12122132',34300000.33,'El camacho');

insert into Impostor (NombreCliente,NumeroCuenta)
values('Pedro Ospina','19234339'),
      ('Jhon Perez','12122132');

insert into Sucursal(NombreSucursal,CiudadSucursal,Activos)
values('Drogueria el acetaminofen', 'medellin' , 4445533133.45),
	  ('El camacho','Bogota',231321312.22);

select * from Impostor
select * from Sucursal
select * from Cliente
select * from Cuenta

delete from Impostor
delete from Sucursal
delete from Cliente
delete from Cuenta