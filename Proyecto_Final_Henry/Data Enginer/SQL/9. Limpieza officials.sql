-- 9. Limpieza officials

SELECT * FROM officials

-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'officials ';


-- Validar la cantidad de nulos por columna

SELECT
    COUNT(CASE WHEN game_id IS NULL THEN 1 END) AS null_game_id,
    COUNT(CASE WHEN official_id IS NULL THEN 1 END) AS null_official_id,
    COUNT(CASE WHEN first_name IS NULL THEN 1 END) AS null_first_name,
    COUNT(CASE WHEN last_name IS NULL THEN 1 END) AS null_last_name,
    COUNT(CASE WHEN jersey_num IS NULL THEN 1 END) AS null_jersey_num
FROM officials;


-- Rellenar valores nulos

UPDATE officials
SET 
	jersey_num = ISNULL(jersey_num, '0')
WHERE 
    jersey_num IS NULL;