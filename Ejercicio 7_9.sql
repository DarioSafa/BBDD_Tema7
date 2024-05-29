SET SERVEROUTPUT ON;

DECLARE
    p1 POLICIA;
    p2 POLICIA;
BEGIN
    p1 := new POLICIA('34547437L','Juan','Perez','Roma',356368247,'LOCAL',1000);
    p2 := new POLICIA('36738384W','Mónica','Martín','Cruz',456857268,'NACIONAL',2300);
    DBMS_OUTPUT.PUT_LINE(p1.calculaSalario(p1.salarioBase));
    DBMS_OUTPUT.PUT_LINE(p2.calculaSalario(p2.salarioBase));
    --Instertamos
    INSERT INTO tPolicias VALUES(p1);
    INSERT INTO tPolicias VALUES(p2);
    --Cambiamos su salario utilizando la funcion 
    UPDATE tPolicias SET salarioBase = p1.calculaSalario(p1.salarioBase) WHERE DNI = '34547437L';
    UPDATE tPolicias SET salarioBase = p2.calculaSalario(p2.salarioBase) WHERE DNI = '36738384W';
END;

    --Ahora podemos manejar tPolicias a través de consultas
    select * from tPolicias;