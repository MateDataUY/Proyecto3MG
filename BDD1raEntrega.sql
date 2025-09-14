CREATE DATABASE MateData3MGv2;
USE MateData3MGv2;

create table Admin(
id_Admin INT AUTO_INCREMENT UNIQUE,
Contrasena VARCHAR (225) NOT NULL,
Nombre VARCHAR(20),
Apellido VARCHAR(20), 
Email VARCHAR(50) NOT NULL,
PRIMARY KEY (id_Admin)
);

create table TelefonoAdmin(
id_Admin INT,
telefono VARCHAR (20),
PRIMARY KEY (id_Admin, telefono),
FOREIGN KEY (id_Admin) REFERENCES Admin(id_Admin)
);



create table Usuario(
id_Usuario INT AUTO_INCREMENT UNIQUE,
Contrasena VARCHAR (225) NOT NULL,
Nombre VARCHAR(20),
Apellido VARCHAR(20), 
Email VARCHAR(50) NOT NULL,
CI VARCHAR (10) UNIQUE,
Direccion VARCHAR (50),
FechaRegistro DATE,
Estado Enum('Activo', 'Pendiente','Rechazado'),
PRIMARY KEY (id_Usuario)
);

create table Telefonousuario(
id_usuario INT,
telefono VARCHAR (20),
PRIMARY KEY (id_Usuario, telefono),
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario)
);



create table UnidadHabitacional(
id_Unidad INT AUTO_INCREMENT UNIQUE,
id_Usuario INT,
Estado_Unidad Enum('Terminada','Construccion'),
NumUnidad INT NOT NULL,
FechaAsignacion DATE NOT NULL,
PRIMARY KEY (id_Unidad),
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario)
);


create table HorasTrabajo(
id_Horas INT AUTO_INCREMENT UNIQUE,
id_Usuario INT,
Semana DATE NOT NULL,
HorasRegistradas DECIMAL NOT NULL,
MotivoFAltante TEXT,
SolicitudExoneracion TEXT NOT NULL,
PagoCompensativo DECIMAL,
Estado Enum('Pendiente','Aprobado','Rechazado'),
PRIMARY KEY (id_Horas),
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario)
);



create table PagoMensaul(
id_Pago INT AUTO_INCREMENT UNIQUE,
id_Usuario INT,
PeriodoPago VARCHAR (10),
Monto DECIMAL, 
ComprobantPago TEXT,
EstadoPago Enum('Pendiente','Aprobado','rechazado'),
PRIMARY KEY (id_Pago),
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario)
);
 
 
 
 create table AvanceObra(
 id_Avance INT AUTO_INCREMENT UNIQUE,
 id_Usuario INT,
 Etapa Enum('Cimentacion','Estructura','Terminaciones'),
 PorcentajeAvance DECIMAL,
 FechaActualizacion DATE,
 Observaciones TEXT,
 PRIMARY KEY (id_Avance),
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario)
);


create table ComprobanteInicial(
id_Comprobante INT AUTO_INCREMENT UNIQUE,
id_Usuario INT,
id_Pago INT,
id_Horas INT,
EStadoAprovacion Enum('Aprobado','Pendiente','Rechazado'),
Observaciones TEXT,
FechaSalida DATE,
Monto DECIMAL,
PRIMARY KEY (id_Comprobante),
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario),
FOREIGN KEY (id_Horas) REFERENCES HorasTrabajo(id_Horas),
FOREIGN KEY (id_Pago) REFERENCES PagoMensaul(id_Pago)
);
