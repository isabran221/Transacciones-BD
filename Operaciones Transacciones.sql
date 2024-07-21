USE TransaccionEjemplo
BEGIN TRANSACTION;

-- Operaciones SQL dentro de la transacción
INSERT INTO Personal (Nombre, Posicion, Salario) VALUES ('Juan Pérez', 'Developer', 60000);
SAVE TRANSACTION SavePoint1;

-- Más operaciones SQL
UPDATE Personal SET Salario = Salario * 1.1 WHERE Posicion = 'Developer';

-- Verificación de condiciones para decidir si confirmar o revertir la transacción
IF (SELECT COUNT(*) FROM Personal WHERE Posicion = 'Developer') > 10
BEGIN
    -- Revertir hasta el punto de guardado
    ROLLBACK TRANSACTION SavePoint1;
    PRINT 'Revertido hasta SavePoint1 debido a que hay más de 10 desarrolladores.';
END
ELSE
BEGIN
    -- Confirmar la transacción completa
    COMMIT TRANSACTION;
    PRINT 'Transacción confirmada.';
END
GO
