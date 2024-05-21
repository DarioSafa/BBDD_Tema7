--7.6 Crea dos tipos objeto llamados profesor y alumno que hereden los atributos existentes en
-- DatosPersonales (ej. 7.1). De los profesores se quiere almacenar la fecha de incorporación y de los
-- alumnos las calificaciones que obtienen en cada una de las cuatro evaluaciones del curso por separado.

CREATE OR REPLACE TYPE datosObjeto AS OBJECT(
    codigoDP NUMBER(3),
    nombreCompleto nombre,
    domicilioPersonal domicilio,
    codigoPostal codPostal,
    fechaNacimiento DATE
) NOT FINAL;

CREATE OR REPLACE TYPE tPROFESOR UNDER datosObjeto(
    incorporacion DATE
);

CREATE OR REPLACE TYPE tALUMNO UNDER datosObjeto(
    cal1 NUMBER,
    cal2 NUMBER,
    cal3 NUMBER,
    cal4 NUMBER
);