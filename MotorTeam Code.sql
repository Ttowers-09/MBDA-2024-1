-- CREACION DE TABLAS**

CREATE TABLE VENDEDOR (
identificador VARCHAR(20) NOT NULL,
nombre VARCHAR(20) NOT NULL,
nit VARCHAR(20) NOT NULL,
correo VARCHAR(50) NULL,
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(20) NOT NULL,
descripcion VARCHAR(20) NOT NULL,
fecharegistro DATE NOT NULL,
categoriaidentificador VARCHAR(10) NOT NULL

);

CREATE TABLE COMPRA (
identificador VARCHAR(10) NOT NULL,
descripcion VARCHAR(250) NOT NULL,
fechacompra DATE NOT NULL,
cantidadpartes VARCHAR(10) NOT NULL,
preciototal VARCHAR(20) NOT NULL,
vendedoridentificador VARCHAR(20) NOT NULL

);

CREATE TABLE ITEMCOMPRA (
cantidad VARCHAR(10) NOT NULL,
precio VARCHAR(50) NOT NULL,
compraidentificador VARCHAR(10) NOT NULL,
identificador VARCHAR(10) NOT NULL

);

CREATE TABLE PARTE (
identificador VARCHAR(10) NOT NULL,
nombre VARCHAR(10) NOT NULL,
peso VARCHAR(50) NOT NULL,
descripcion VARCHAR(20) NOT NULL,
precio VARCHAR(20) NOT NULL,
itemcompraidentificador VARCHAR(10) NOT NULL,
categoriaidentificador VARCHAR(10) NOT NULL

);

CREATE TABLE CATEGORIA (
identificador VARCHAR(10) NOT NULL,
nombre VARCHAR(20) NOT NULL,
descripcion VARCHAR(250) NOT NULL,
parteidentificador VARCHAR(10) NOT NULL,
vendedoridentificador VARCHAR(20) NOT NULL

);

CREATE TABLE FORO (
identificador VARCHAR(10) NOT NULL,
categoria VARCHAR(10) NOT NULL,
descripcion VARCHAR(250) NOT NULL,
calificacion CHAR(1) NOT NULL,
fecha DATE NOT NULL,
parteidentificador VARCHAR(10) NOT NULL,
compradoridentificador VARCHAR(10) NOT NULL
);

CREATE TABLE ITEMVENTA (
cantidad VARCHAR(10) NOT NULL,
precio VARCHAR(50) NOT NULL,
parteidentificador VARCHAR(10) NOT NULL,
identificador VARCHAR(10) NOT NULL
);

CREATE TABLE VENTA (
identificador VARCHAR(10) NOT NULL,
descripcion VARCHAR(250) NOT NULL,
fecha DATE NOT NULL,
cantidadpartes VARCHAR(10) NOT NULL,
preciototal VARCHAR(20) NOT NULL,
itemventaidentificador VARCHAR(10) NOT NULL,
compradoridentificador VARCHAR(10) NOT NULL
);

CREATE TABLE INSTALACION (
identificador VARCHAR(10) NOT NULL,
estado CHAR(1) NOT NULL,
ventaidentificador VARCHAR(10) NOT NULL

);

CREATE TABLE ENVIO (
identificador VARCHAR(10),
estado CHAR(1),
ventaidentificador VARCHAR(10) NOT NULL

);

CREATE TABLE ENVIOESTANDAR (
identificador VARCHAR(10),
fechadeentrega DATE,
envioidentificador VARCHAR(10) 

);

CREATE TABLE ENVIORAPIDO (
identificador VARCHAR(10),
fechadeentrega DATE,
envioidentificador VARCHAR(10),
tarifa VARCHAR(20) 

);

CREATE TABLE GARANTIA (
identificador VARCHAR(10) NOT NULL,
descripcionda?oparte VARCHAR(250) NOT NULL,
fechadesolicitud DATE NOT NULL,
fechaentrega DATE NOT NULL,
parteidentificador VARCHAR(10) NOT NULL

);

CREATE TABLE REPARACION (
identificador VARCHAR(10) NOT NULL,
descripcionda?oparte VARCHAR(250) NOT NULL,
garantiaidentificador VARCHAR(10) NOT NULL,
descripcionsolucion VARCHAR(250) NOT NULL

);

CREATE TABLE REEMPLAZO (
identificador VARCHAR(10) NOT NULL,
descripcionda?os VARCHAR(250) NOT NULL,
garantiaidentificador VARCHAR(10) NOT NULL,
piezasdecambio VARCHAR(250) NOT NULL

);

CREATE TABLE COMPRADOR (
identificador VARCHAR(10) NOT NULL,
nombre VARCHAR(20) NOT NULL,
descripcion VARCHAR(250) NOT NULL,
vehiculo VARCHAR(20) NOT NULL,
preferencias VARCHAR(250) NOT NULL,
correo VARCHAR(50) NULL,
direccion VARCHAR(50) NOT NULL,
fecharegistro DATE NOT NULL,
ventaidentificador VARCHAR(10) NOT NULL

);

CREATE TABLE VEHICULO (
marca VARCHAR(20) NOT NULL,
modelo VARCHAR(10) NOT NULL,
carroceria VARCHAR(20) NOT NULL,
cilindrada INT NOT NULL,
modificaciones VARCHAR(250) NOT NULL,
placa VARCHAR(6) NOT NULL,
compradoridentificador VARCHAR(10) NOT NULL

);




---PRIMARY KEY--

ALTER TABLE COMPRA ADD CONSTRAINT PK_COMPRA
PRIMARY KEY(IDENTIFICADOR);

ALTER TABLE ENVIO ADD CONSTRAINT PK_ENVIO
PRIMARY KEY(IDENTIFICADOR);

ALTER TABLE ENVIOESTANDAR ADD CONSTRAINT PK_ENVIOESTANDAR
PRIMARY KEY(IDENTIFICADOR);

ALTER TABLE ENVIORAPIDO ADD CONSTRAINT PK_ENVIORAPIDO
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE FORO ADD CONSTRAINT PK_FORO
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE INSTALACION ADD CONSTRAINT PK_INSTALACION
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE ITEMCOMPRA ADD CONSTRAINT PK_ITEMCOMPRA
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE ITEMVENTA ADD CONSTRAINT PK_ITEMVENTA
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE PARTE ADD CONSTRAINT PK_PARTE
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE VENDEDOR ADD CONSTRAINT PK_VENDEDOR
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE VENTA ADD CONSTRAINT PK_VENTA
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE CATEGORIA ADD CONSTRAINT PK_CATEGORIA
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE COMPRADOR ADD CONSTRAINT PK_COMPRADOR
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE REEMPLAZO ADD CONSTRAINT PK_REEMPLAZO
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE REPARACION ADD CONSTRAINT PK_REPARACION
PRIMARY KEY (IDENTIFICADOR);

ALTER TABLE VEHICULO ADD CONSTRAINT PK_VEHICULO
PRIMARY KEY (PLACA);

ALTER TABLE GARANTIA ADD CONSTRAINT PK_GARANTIA
PRIMARY KEY (IDENTIFICADOR);





--FOREING KEY--
ALTER TABLE VENDEDOR ADD CONSTRAINT FK_VENDEDOR_CATEGORIA
FOREIGN KEY (CATEGORIAIDENTIFICADOR) REFERENCES CATEGORIA(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE COMPRA ADD CONSTRAINT FK_COMPRA_VENDEDOR
FOREIGN KEY (VENDEDORIDENTIFICADOR) REFERENCES VENDEDOR(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE ITEMCOMPRA ADD CONSTRAINT FK_ITEMCOMPRA_COMPRA
FOREIGN KEY (COMPRAIDENTIFICADOR) REFERENCES COMPRA(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE PARTE ADD CONSTRAINT FK_PARTE_ITEMCOMPRA
FOREIGN KEY (ITEMCOMPRAIDENTIFICADOR) REFERENCES ITEMCOMPRA(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE PARTE ADD CONSTRAINT FK_PARTE_CATEGORIA
FOREIGN KEY (CATEGORIAIDENTIFICADOR) REFERENCES CATEGORIA(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE GARANTIA ADD CONSTRAINT FK_GARANTIA_PARTE
FOREIGN KEY (PARTEIDENTIFICADOR) REFERENCES PARTE (IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE REPARACION ADD CONSTRAINT FK_REPARACION_GARANTIA
FOREIGN KEY (GARANTIAIDENTIFICADOR) REFERENCES GARANTIA(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE REEMPLAZO ADD CONSTRAINT FK_REEMPLAZO_GARANTIA
FOREIGN KEY (GARANTIAIDENTIFICADOR) REFERENCES GARANTIA (IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE CATEGORIA ADD CONSTRAINT FK_CATEGORIA_PARTE
FOREIGN KEY (PARTEIDENTIFICADOR) REFERENCES PARTE(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE CATEGORIA ADD CONSTRAINT FK_CATEGORIA_VENDEDOR
FOREIGN KEY (VENDEDORIDENTIFICADOR) REFERENCES VENDEDOR(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE FORO ADD CONSTRAINT FK_FORO_PARTE
FOREIGN KEY (PARTEIDENTIFICADOR) REFERENCES PARTE(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE FORO ADD CONSTRAINT FK_FORO_COMPRADOR
FOREIGN KEY (COMPRADORIDENTIFICADOR) REFERENCES COMPRADOR(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE ITEMVENTA ADD CONSTRAINT FK_ITEMVENTA_PARTE
FOREIGN KEY (PARTEIDENTIFICADOR) REFERENCES PARTE(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE VENTA ADD CONSTRAINT FK_VENTA_ITEMVENTA
FOREIGN KEY (ITEMVENTAIDENTIFICADOR) REFERENCES ITEMVENTA(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE VENTA ADD CONSTRAINT FK_VENTA_COMPRADOR
FOREIGN KEY (COMPRADORIDENTIFICADOR) REFERENCES COMPRADOR(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE COMPRADOR ADD CONSTRAINT FK_COMPRADOR_VENTA
FOREIGN KEY (VENTAIDENTIFICADOR) REFERENCES VENTA(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE VEHICULO ADD CONSTRAINT FK_VEHICULO_COMPRADOR
FOREIGN KEY (COMPRADORIDENTIFICADOR) REFERENCES COMPRADOR(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE INSTALACION ADD CONSTRAINT FK_INSTALACION_VENTA
FOREIGN KEY (VENTAIDENTIFICADOR) REFERENCES VENTA(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE ENVIO ADD CONSTRAINT FK_ENVIO_VENTA
FOREIGN KEY (VENTAIDENTIFICADOR) REFERENCES VENTA(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE ENVIOESTANDAR ADD CONSTRAINT FK_ENVIOESTANDAR_ENVIO
FOREIGN KEY (ENVIOIDENTIFICADOR) REFERENCES ENVIO(IDENTIFICADOR)
ON DELETE CASCADE;

ALTER TABLE ENVIORAPIDO ADD CONSTRAINT FK_ENVIORAPIDO_ENVIO
FOREIGN KEY (ENVIOIDENTIFICADOR) REFERENCES ENVIO (IDENTIFICADOR)
ON DELETE CASCADE;


--UNICAS--
ALTER TABLE VENDEDOR ADD CONSTRAINT UK_VENDEDOR 
UNIQUE (nit, correo);

ALTER TABLE COMPRADOR ADD CONSTRAINT UK_COMPRADOR
UNIQUE (correo);



--CHECKS
ALTER TABLE VENDEDOR 
ADD CONSTRAINT T_CORREO CHECK (REGEXP_LIKE(correo, '^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'));

ALTER TABLE COMPRADOR ADD CONSTRAINT T_CORREO1
CHECK (REGEXP_LIKE(correo, '^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'));

ALTER TABLE ENVIO
ADD CONSTRAINT T_ESTADO CHECK(estado IN ('B','C','E'));


ALTER TABLE FORO
ADD CONSTRAINT T_PUNTUACION CHECK(calificacion IN ('1','2','3','4','5'));

ALTER TABLE VENDEDOR
ADD CONSTRAINT TDIRECCIONVENDEDOR CHECK (direccion LIKE '%#%');

ALTER TABLE COMPRADOR
ADD CONSTRAINT TDIRECCIONCOMPRADOR CHECK (direccion LIKE '%#%');


ALTER TABLE COMPRA 
MODIFY (fechacompra DATE DEFAULT SYSDATE);

ALTER TABLE VENDEDOR 
MODIFY (fecharegistro DATE DEFAULT SYSDATE);

ALTER TABLE VENTA 
MODIFY (fecha DATE DEFAULT SYSDATE);

ALTER TABLE ENVIOESTANDAR
MODIFY (fechadeentrega DATE DEFAULT SYSDATE);

ALTER TABLE ENVIORAPIDO
MODIFY (fechadeentrega DATE DEFAULT SYSDATE);

ALTER TABLE GARANTIA 
MODIFY (fechaentrega DATE DEFAULT SYSDATE);

ALTER TABLE GARANTIA 
MODIFY (fechadesolicitud DATE DEFAULT SYSDATE);

ALTER TABLE COMPRADOR 
MODIFY (fecharegistro DATE DEFAULT SYSDATE);

ALTER TABLE FORO 
MODIFY (fecha DATE DEFAULT SYSDATE);

ALTER TABLE COMPRA 
ADD CONSTRAINT T_MONEDACOMPRA CHECK (preciototal > 0 AND MOD(preciototal, 100) = 0);

ALTER TABLE VENTA 
ADD CONSTRAINT T_MONEDAVENTA CHECK (preciototal > 0 AND MOD(preciototal, 100) = 0);

ALTER TABLE PARTE 
ADD CONSTRAINT T_MONEDAPARTE CHECK (precio > 0 AND MOD(precio, 100) = 0);

ALTER TABLE ITEMCOMPRA 
ADD CONSTRAINT T_MONEDAITEMCOMPRA CHECK (precio > 0 AND MOD(precio, 100) = 0);

ALTER TABLE ITEMVENTA 
ADD CONSTRAINT T_MONEDAITEMVENTA CHECK (precio > 0 AND MOD(precio, 100) = 0);

ALTER TABLE ENVIORAPIDO 
ADD CONSTRAINT T_MONEDAENVIORAPIDO CHECK (tarifa > 0 AND MOD(tarifa, 100) = 0);

ALTER TABLE PARTE
ADD CONSTRAINT T_PESO CHECK (peso BETWEEN 01 AND 99);



-- XTABLAS--

DROP TABLE INSTALACION;
DROP TABLE ENVIOESTANDAR;
DROP TABLE ENVIORAPIDO;
DROP TABLE REPARACION;
DROP TABLE REEMPLAZO;
DROP TABLE VEHICULO;
DROP TABLE FORO;
DROP TABLE ENVIO;
DROP TABLE GARANTIA;
DROP TABLE VENDEDOR cascade constraints ;
DROP TABLE COMPRA cascade constraints ;
DROP TABLE ITEMCOMPRA cascade constraints ;
DROP TABLE PARTE cascade constraints ;
DROP TABLE CATEGORIA cascade constraints ;
DROP TABLE ITEMVENTA cascade constraints ;
DROP TABLE VENTA cascade constraints ;
DROP TABLE COMPRADOR cascade constraints ;