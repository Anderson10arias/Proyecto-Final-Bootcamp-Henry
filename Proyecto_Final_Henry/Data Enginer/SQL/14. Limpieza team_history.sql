-- 14. Limpieza team_history

------------------------ NO REQUIERE LIMPIEZA ------------------------

SELECT * FROM team_history

-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'team_history ';


-- Validar la cantidad de nulos por columna

SELECT 
    COUNT(CASE WHEN team_id IS NULL THEN 1 END) AS null_team_id,
    COUNT(CASE WHEN city IS NULL THEN 1 END) AS null_city,
    COUNT(CASE WHEN nickname IS NULL THEN 1 END) AS null_nickname,
    COUNT(CASE WHEN year_founded IS NULL THEN 1 END) AS null_year_founded,
    COUNT(CASE WHEN year_active_till IS NULL THEN 1 END) AS null_year_active_till
FROM team_history;
