CREATE OR REPLACE TYPE PERSONA AS OBJECT(
    dni varchar(9),
    nombre varchar(30),
    prApellido varchar(30),
    sgApellido varchar(30),
    fechaNacimiento DATE,
    MEMBER FUNCTION muestraEdad return NUMBER,
    CONSTRUCTOR FUNCTION PERSONA (dni VARCHAR,nombre VARCHAR, prApellido VARCHAR,sgApellido VARCHAR, fechaNacimiento DATE)
    RETURN SELF AS RESULT
);

CREATE OR REPLACE TYPE BODY PERSONA AS
CONSTRUCTOR FUNCTION PERSONA (dni VARCHAR,nombre VARCHAR, prApellido VARCHAR,sgApellido VARCHAR, fechaNacimiento DATE) RETURN SELF AS RESULT IS
BEGIN
    self.dni:= dni;
    self.nombre:=nombre;
    self.prApellido:=prApellido;
    self.sgApellido:=sgApellido;
    self.fechaNacimiento:=fechaNacimiento;
    RETURN;
    END PERSONA;
    
MEMBER FUNCTION muestraEdad RETURN NUMBER IS
edad NUMBER;
BEGIN
edad := TO_NUMBER(TO_CHAR(SYSDATE,'yyyy'))-TO_NUMBER(TO_CHAR(self.fechaNacimiento,'yyyy'));
return edad;
END muestraEdad;
END;

DECLARE
    p1 PERSONA:= PERSONA('22563561L','Pepe','Amigo','Pérez','05/11/2000');
    edad NUMBER;
BEGIN
    edad:=p1.muestraEdad();
    DBMS_OUTPUT.PUT_LINE(p1.nombre ||' ' ||edad);
END;