-- 12. Limpieza team

------------------------ NO REQUIERE LIMPIEZA ------------------------

SELECT * FROM team

-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'team ';


-- Validar la cantidad de nulos por columna

SELECT 
    COUNT(CASE WHEN id IS NULL THEN 1 END) AS null_id,
    COUNT(CASE WHEN full_name IS NULL THEN 1 END) AS null_full_name,
    COUNT(CASE WHEN abbreviation IS NULL THEN 1 END) AS null_abbreviation,
    COUNT(CASE WHEN nickname IS NULL THEN 1 END) AS null_nickname,
    COUNT(CASE WHEN city IS NULL THEN 1 END) AS null_city,
    COUNT(CASE WHEN state IS NULL THEN 1 END) AS null_state,
    COUNT(CASE WHEN year_founded IS NULL THEN 1 END) AS null_year_founded
FROM team;

