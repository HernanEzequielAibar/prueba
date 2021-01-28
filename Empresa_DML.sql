CREATE DATABASE Empresa;
USE Empresa;


CREATE TABLE Empleado(
num_emp SMALLINT AUTO_INCREMENT PRIMARY KEY,
nom_emp VARCHAR(50) NOT NULL,
sueldo_emp DECIMAL NOT NULL,
num_dep SMALLINT
);

INSERT INTO Empleado(nom_emp,sueldo_emp,num_dep) VALUES('ricardo',20000,1);
INSERT INTO Empleado(nom_emp,sueldo_emp,num_dep) VALUES('carlos',5000,2);

select * 
from EMpleado;



CREATE TABLE Departamento(
num_dep SMALLINT AUTO_INCREMENT PRIMARY KEY,
nom_dep VARCHAR(50) NOT NULL,
emp_superv SMALLINT,
FOREIGN KEY (emp_superv) REFERENCES Empleado(num_emp)
);
INSERT INTO departamento(nom_dep,emp_superv) values('ingenieria',1);
INSERT INTO departamento(nom_dep,emp_superv) values('ingenieria',2);

SELECT *
FROM Departamento;


create table localidad(
cod_loc SMALLINT AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(50) NOT NULL
);
insert into localidad(descripcion) values('ramos mejia');
select *
from localidad;

CREATE TABLE Proyecto(
num_proy SMALLINT AUTO_INCREMENT PRIMARY KEY,
nom_proy VARCHAR(50) NOT NULL,
fecha_inicio DATE NOT NULL,
cod_loc SMALLINT,
foreign key(cod_loc) references localidad(cod_loc)
);

insert into proyecto(nom_proy,fecha_inicio,cod_loc) values('robot','20201203',1);
insert into proyecto(nom_proy,fecha_inicio,cod_loc) values('animatronico','20201203',1);
insert into proyecto(nom_proy,fecha_inicio,cod_loc) values('applet','20201203',1);

CREATE TABLE trabaja(
num_emp smallint,
num_proy smallint,
constraint emp_proy primary key (num_emp,num_proy),
horas int,
foreign key(num_emp) references empleado(num_emp),
foreign key(num_proy) references proyecto(num_proy)
);
insert into trabaja(num_emp,num_proy,horas) values(1,1,30);
insert into trabaja(num_emp,num_proy,horas) values(2,1,30);
insert into trabaja(num_emp,num_proy,horas) values(2,2,30);
insert into trabaja(num_emp,num_proy,horas) values(1,3,30);
insert into trabaja(num_emp,num_proy,horas) values(1,2,30);