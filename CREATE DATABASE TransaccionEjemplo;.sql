CREATE DATABASE TransaccionEjemplo;
GO

USE TransaccionEjemplo;
GO

CREATE TABLE Personal (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50),
    Posicion NVARCHAR(50),
    Salario DECIMAL(10, 2)
);
GO
