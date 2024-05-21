--7.3 Añade a cada tipo de objeto creado en el ejercicio 7.1 un método procedimiento que inicialice
--los valores pasados como argumentos. Prueba el funcionamiento de dichos procedimientos para
--cada uno de los tipo de objetos creados.

--Borramos datosObjeto para poder re ejecutar los tipos que contiene
DROP TYPE datosObjeto;

CREATE OR REPLACE TYPE codPostal AS OBJECT(
    localidad NUMBER(3),
    provincia NUMBER(2),
    MEMBER PROCEDURE iniCodPostal(localidad NUMBER,provincia NUMBER)
);

CREATE OR REPLACE TYPE domicilio AS OBJECT(
    tipodeVia VARCHAR(20),
    nombreVia VARCHAR(40),
    numero NUMBER(3),
    restoDomicilio VARCHAR(40),
    MEMBER PROCEDURE iniDomicilio(tipodeVia VARCHAR,nombreVia VARCHAR,numero NUMBER,restoDomicilio VARCHAR)
);

CREATE OR REPLACE TYPE nombre AS OBJECT(
    nombrePersona VARCHAR(30),
    prApellido VARCHAR(30),
    sgApellido VARCHAR(30),
    member PROCEDURE iniNombre(nombrePersona VARCHAR,prApellido VARCHAR,sgApellido VARCHAR)
);

CREATE OR REPLACE TYPE datosObjeto AS OBJECT(
    codigoDP NUMBER(3),
    nombreCompleto nombre,
    domicilioPersonal domicilio,
    codigoPostal codPostal,
    fechaNacimiento DATE,
    MEMBER PROCEDURE iniDatos(codigoDP NUMBER,nombreCompleto nombre, domicilioPersonal domicilio, codigoPostal codPostal,fechaNacimiento DATE)
);

--BODY CODIGO POSTAL

CREATE OR REPLACE TYPE BODY codPostal AS
MEMBER PROCEDURE iniCodPostal(localidad NUMBER,provincia NUMBER) IS
BEGIN
SELF.localidad:=localidad;
SELF.provincia:=provincia;
END iniCodPostal;
END;

--BODY DOMICILIO

CREATE OR REPLACE TYPE BODY domicilio AS
MEMBER PROCEDURE iniDomicilio(tipodeVia VARCHAR,nombreVia VARCHAR,numero NUMBER,restoDomicilio VARCHAR) IS
BEGIN
SELF.tipodeVia:=tipodeVia;
SELF.nombreVia:=nombreVia;
SELF.numero:=numero;
SELF.restoDomicilio:=restoDomicilio;
END iniDomicilio;
END;

--BODY NOMBRE

CREATE OR REPLACE TYPE BODY nombre AS
MEMBER PROCEDURE iniNombre(nombrePersona VARCHAR,prApellido VARCHAR,sgApellido VARCHAR) IS
BEGIN
SELF.nombrePersona:=nombrePersona;
SELF.prApellido:=prApellido;
SELF.sgApellido:=sgApellido;
END iniNombre;
END;

--BODY DATOS

CREATE OR REPLACE TYPE BODY datosObjeto AS
MEMBER PROCEDURE iniDatos(codigoDP NUMBER,nombreCompleto nombre, domicilioPersonal domicilio, codigoPostal codPostal,fechaNacimiento DATE) IS
BEGIN
SELF.codigoDP:=codigoDP;
SELF.nombreCompleto:=nombreCompleto;
SELF.domicilioPersonal:=domicilioPersonal;
SELF.codigoPostal:=codigoPostal;
SELF.fechaNacimiento:=fechaNacimiento;
END iniDatos;
END;

--PRUEBA

SET SERVEROUTPUT ON;

DECLARE
cod1 codPostal:= new codPostal(006,47);
dom1 domicilio:=new domicilio('calle','del sol',40,'2ºD');
n1 nombre:= new nombre('Hector','Gracia','Perez');
dat1 datosObjeto:=new datosObjeto(111,n1,dom1,cod1,'07/03/2023');
BEGIN
DBMS_OUTPUT.PUT_LINE('Codigo postal: '|| cod1.localidad || ' ' || cod1.provincia);
DBMS_OUTPUT.PUT_LINE('Domicilio: '|| dom1.tipodeVia || ' ' || dom1.nombreVia ||' '|| dom1.numero ||' ' || dom1.restoDomicilio);
DBMS_OUTPUT.PUT_LINE('Nombre: '|| n1.nombrePersona || ' ' || n1.prApellido ||' ' || n1.sgApellido);
DBMS_OUTPUT.PUT_LINE('Datos objeto: '|| dat1.codigoPostal.localidad || ' ' || dat1.codigoPostal.provincia || ' ' || dat1.nombreCompleto.nombrePersona|| ' ' || dat1.nombreCompleto.prApellido || ' ' || dat1.nombreCompleto.sgApellido );

cod1.iniCodPostal(48,008);
dom1.iniDomicilio('Via','Princesa',47,'.');
n2.iniNombre('Guillermo','Martin','Bragado');
dat1.iniDatos(111,n2,dom1,cod1,'07/03/2024');
DBMS_OUTPUT.PUT_LINE('Codigo postal: '|| cod1.localidad || ' ' || cod1.provincia);
DBMS_OUTPUT.PUT_LINE('Domicilio: '|| dom1.tipodeVia || ' ' || dom1.nombreVia ||' '|| dom1.numero ||' ' || dom1.restoDomicilio);
DBMS_OUTPUT.PUT_LINE('Nombre: '|| n2.nombrePersona || ' ' || n2.prApellido ||' ' || n2.sgApellido);
DBMS_OUTPUT.PUT_LINE('Datos objeto: '|| dat1.codigoPostal.localidad || ' ' || dat1.codigoPostal.provincia || ' ' || dat1.nombreCompleto.nombrePersona|| ' ' || dat1.nombreCompleto.prApellido || ' ' || dat1.nombreCompleto.sgApellido );
END;