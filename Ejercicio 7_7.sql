--7.7 Usando los tipo objeto de la actividad anterior instancia, empleando NEW, un objeto tipo profesor y otro
--objeto tipo alumno. Los datos son los siguientes

-- - Profesor: Dolores SANCHEZ GOMEZ, vive en Plaza España, 103, 1oA, 28003, Madrid.  Contratada el 1/9/2021.
-- - Alumno: Luis MARIN SOL, vive en calle Laguna, 12, 28660, Boadilla del Monte, y obtiene las
--calificaciones 4, 4, 5 correspondientes a las tres evaluaciones parciales y un 7 en la calificación final.


DECLARE
--declaracion datos profesor
    cod1 codPostal:= new codPostal(003,28);
    dom1 domicilio:=new domicilio('Plaza','España',105,'1ºA');
    n1 nombre:= new nombre('Dolores','SANCHEZ','GOMEZ');
    p1 tPROFESOR:= new tPROFESOR(111,n1,dom1,cod1,'07/03/1995','1/9/2021');
--declaracion datos alumno
    cod2 codPostal:= new codPostal(660,28);
    dom2 domicilio:=new domicilio('calle','Laguna',12,null);
    luis nombre:= new nombre('Luis','MARIN','SOL');
    p2 tALUMNO:= new tALUMNO(112,luis,dom2,cod2,'11/05/2000',4,4,5,7);
    
BEGIN
--Mostrar datos profe
    DBMS_OUTPUT.PUT_LINE('-- DATOS PROFESOR --');
    DBMS_OUTPUT.PUT_LINE('Codigo postal: '|| cod1.localidad || ' ' || cod1.provincia);
    DBMS_OUTPUT.PUT_LINE('Domicilio: '|| dom1.tipodeVia || ' ' || dom1.nombreVia ||' '|| dom1.numero ||' ' || dom1.restoDomicilio);
    DBMS_OUTPUT.PUT_LINE('Nombre: '|| n1.nombrePersona || ' ' || n1.prApellido ||' ' || n1.sgApellido);
    DBMS_OUTPUT.PUT_LINE('Datos Profesor: '|| p1.codigoPostal.localidad || ' ' || p1.codigoPostal.provincia || ' ' || p1.nombreCompleto.nombrePersona|| ' ' || p1.nombreCompleto.prApellido || ' ' || p1.nombreCompleto.sgApellido || ' Fecha incorporacion: ' || p1.incorporacion);
--Mostrar datos alumno
    DBMS_OUTPUT.PUT_LINE('-- DATOS ALUMNO --');
  DBMS_OUTPUT.PUT_LINE('Codigo postal: '|| cod2.localidad || ' ' || cod2.provincia);
    DBMS_OUTPUT.PUT_LINE('Domicilio: '|| dom2.tipodeVia || ' ' || dom2.nombreVia ||' '|| dom2.numero ||' ' || dom2.restoDomicilio);
    DBMS_OUTPUT.PUT_LINE('Nombre: '|| luis.nombrePersona || ' ' || luis.prApellido ||' ' || luis.sgApellido);
    DBMS_OUTPUT.PUT_LINE('Datos Alumno: '|| p2.codigoPostal.localidad || ' ' || p2.codigoPostal.provincia || ' ' || p2.nombreCompleto.nombrePersona|| ' ' || p2.nombreCompleto.prApellido || ' ' || p2.nombreCompleto.sgApellido || ' Nota trimestre 1: ' || p2.cal1|| ' Nota trimestre 2: ' || p2.cal2 || ' Nota trimestre 3: ' || p2.cal3 || ' Nota trimestre 4: ' || p2.cal4);
END;