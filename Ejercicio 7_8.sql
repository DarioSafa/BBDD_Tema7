CREATE OR REPLACE TYPE empleado AS OBJECT(
    DNI VARCHAR2(9),
    nombre VARCHAR2(30),
    ap1 VARCHAR2(30),
    ap2 VARCHAR2(30),
    telefono NUMBER(9)
) NOT FINAL;

CREATE OR REPLACE TYPE INSPECTOR UNDER EMPLEADO(
    especialidad varchar2(30)
);

create or replace type POLICIA under EMPLEADO(
    categoria varchar(30),
    salarioBase number(6,2),
    MEMBER FUNCTION calculaSalario(salarioBase NUMBER) return NUMBER
);

CREATE OR REPLACE TYPE BODY POLICIA AS
MEMBER FUNCTION calculaSalario(salarioBase NUMBER) RETURN NUMBER IS   
    salarioFinal NUMBER;
    BEGIN
        IF SELF.CATEGORIA='LOCAL' THEN
            salarioFinal:= salarioBase*1.05;
        ELSIF SELF.CATEGORIA='NACIONAL' THEN
            salarioFinal:= salarioBase*1.15;
        ELSIF SELF.CATEGORIA='OPERACIONES ESPECIALES' THEN
            salarioFinal:= salarioBase*1.20;
        END IF;
        return salarioFinal;
    END;
END;

CREATE TABLE tPolicias OF POLICIA;
CREATE TABLE tInspector OF INSPECTOR;

