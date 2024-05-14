--7.4 Crea un objeto tipo Persona que almacene su dni, nombre, apellidos y fecha de nacimiento. Se crea una
--función MEMBER llamada muestraEdad que devuelve un NUMBER. Crea el cuerpo del objeto en el que
--aparecerá la función muestraEdad, que calcula tu edad a través de la diferencia entre tu año de
--nacimiento y el año actual.

CREATE OR REPLACE TYPE PERSONA AS OBJECT(
    dni varchar(9),
    nombre varchar(30),
    prApellido varchar(30),
    sgApellido varchar(30),
    fechaNacimiento DATE,
    MEMBER FUNCTION muestraEdad return NUMBER
);

CREATE OR REPLACE TYPE BODY PERSONA AS
MEMBER FUNCTION muestraEdad RETURN NUMBER IS
edad NUMBER;
BEGIN
edad := TO_NUMBER(TO_CHAR(SYSDATE,'yyyy'))-TO_NUMBER(TO_CHAR(self.fechaNacimiento,'yyyy'));
return edad;
END muestraEdad;
END;

--7.5 Crea un bloque anónimo en el que declares una variable tipo persona. Inicializa esa variable a través de
--su constructor y luego muestra el nombre y la edad del trabajador.

SET SERVEROUTPUT ON
DECLARE

p1 persona := new persona('24645739M','Luis','Gomez','Miranda','02/04/2000');
edad NUMBER:=p1.muestraEdad();

BEGIN

DBMS_OUTPUT.PUT_LINE('Nombre: ' || p1.nombre || ' y edad: ' || edad);

END;