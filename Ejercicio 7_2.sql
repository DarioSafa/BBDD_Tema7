--7.2 Genera los objetos correspondientes al tipo de objeto DatosPersonales según la siguiente tabla:
SET SERVEROUTPUT ON;
DECLARE
    codPostal1 codPostal:= new codPostal(41,001);
    codPostal2 codPostal:= new codPostal(28,001);
    nombre1 nombre := new nombre('Ángela','Negro','Castilla');
    nombre2 nombre := new nombre('Tom','Oxley',null);
    domicilio1 domicilio := new domicilio('Avenida','Postigo',100,'1ºA');
    domicilio2 domicilio := new domicilio('Calle','Salado',114,'21ºIzq Bloque 2');
    datosObjeto1 datosObjeto:= new datosObjeto(1,nombre1,domicilio1,codPostal1,'10/05/2024');
    datosObjeto2 datosObjeto:= new datosObjeto(2,nombre2,domicilio2,codPostal2,'08/05/2024');
BEGIN

    DBMS_OUTPUT.PUT_LINE(datosObjeto1.nombreCompleto.nombrePersona);

END;