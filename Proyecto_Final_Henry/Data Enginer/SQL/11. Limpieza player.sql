-- 11. Limpieza player

SELECT * FROM player

-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'player ';


-- Validar la cantidad de nulos por columna

SELECT
    COUNT(CASE WHEN id IS NULL THEN 1 END) AS null_id,
    COUNT(CASE WHEN full_name IS NULL THEN 1 END) AS null_full_name,
    COUNT(CASE WHEN first_name IS NULL THEN 1 END) AS null_first_name,
    COUNT(CASE WHEN last_name IS NULL THEN 1 END) AS null_last_name,
    COUNT(CASE WHEN is_active IS NULL THEN 1 END) AS null_is_active
FROM player;														-- Tenemos solo 6 nulos

-- Eliminar las filas donde 'first_name' es nulo

DELETE FROM player
WHERE first_name IS NULL;

-- Pasamos de 4831 a 4825 filas
