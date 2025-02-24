-- 5. Limpieza game_info

SELECT * FROM game_info

-- Eliminar todos los datos de partidos antes del 2012

DELETE FROM game_info
WHERE game_date < '2012-01-01';

-- Pasamos de 58053 a 13435 donde 'game_date' >= 2012

-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'game_info ';


-- Validar la cantidad de nulos
SELECT
    COUNT(CASE WHEN game_id IS NULL THEN 1 END) AS null_game_id,
    COUNT(CASE WHEN game_date IS NULL THEN 1 END) AS null_game_date,
    COUNT(CASE WHEN attendance IS NULL THEN 1 END) AS null_attendance,
    COUNT(CASE WHEN game_time IS NULL THEN 1 END) AS null_game_time
FROM game_info;

SELECT * FROM game_info

--- Actualizar los valores nulos en la columna 'attendance' con la media sin decimales
UPDATE game_info
SET attendance = (SELECT ROUND(AVG(attendance), 0) FROM game_info)
WHERE attendance IS NULL;

--- Actualizar los valores nulos en la columna 'game_time' con la moda

UPDATE game_info
SET game_time = (
    SELECT TOP 1 game_time
    FROM game_info
    WHERE game_time IS NOT NULL
    GROUP BY game_time
    ORDER BY COUNT(*) DESC
)
WHERE game_time IS NULL;


