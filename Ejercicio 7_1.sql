/*7.1 Crea cuatro tipos de datos objeto:

- Uno para el código postal donde se guardará la localidad y la provincia.
- Otro para el domicilio, formado por los atributos tipodeVia, nombreVia, numero,
restoDomicilio.
- Otro para el nombre completo: nombre, prApellido, sgApellido.
- Otro para los DatosPersonales con los atributos: codigoDP, nombreCompleto, domicilio,
codigoPostal y fechaNacimiento.*/
CREATE OR REPLACE TYPE  codPostal AS OBJECT(
    localidad NUMBER(3),
    provincia NUMBER(2)
);

CREATE OR REPLACE TYPE domicilio AS OBJECT(
    tipodeVia VARCHAR(20),
    nombreVia VARCHAR(40),
    numero NUMBER(3),
    restoDomicilio VARCHAR(40)
);

CREATE OR REPLACE TYPE nombre AS OBJECT(
    nombrePersona VARCHAR(30),
    prApellido VARCHAR(30),
    sgApellido VARCHAR(30)
);

CREATE OR REPLACE TYPE datosObjeto AS OBJECT(
    codigoDP NUMBER(3),
    nombreCompleto nombre,
    domicilioPersonal domicilio,
    codigoPostal codPostal,
    fechaNacimiento DATE
);