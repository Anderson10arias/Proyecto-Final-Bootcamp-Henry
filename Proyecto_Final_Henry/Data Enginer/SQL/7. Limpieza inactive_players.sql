-- 7. Limpieza inactive_players

SELECT * FROM inactive_players

-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'inactive_players ';

-- Validar la cantidad de nulos

SELECT
    COUNT(CASE WHEN game_id IS NULL THEN 1 END) AS null_game_id,
    COUNT(CASE WHEN player_id IS NULL THEN 1 END) AS null_player_id,
    COUNT(CASE WHEN first_name IS NULL THEN 1 END) AS null_first_name,
    COUNT(CASE WHEN last_name IS NULL THEN 1 END) AS null_last_name,
    COUNT(CASE WHEN jersey_num IS NULL THEN 1 END) AS null_jersey_num,
    COUNT(CASE WHEN team_id IS NULL THEN 1 END) AS null_team_id,
    COUNT(CASE WHEN team_city IS NULL THEN 1 END) AS null_team_city,
    COUNT(CASE WHEN team_name IS NULL THEN 1 END) AS null_team_name,
    COUNT(CASE WHEN team_abbreviation IS NULL THEN 1 END) AS null_team_abbreviation
FROM inactive_players;


-- Eliminar las filas donde la columna 'first_name' es valor NULL

DELETE FROM inactive_players
WHERE first_name IS NULL;		-- Se eliminó solo una fila


-- Rellenar valores nulos

UPDATE inactive_players
SET 
	jersey_num = ISNULL(jersey_num, '0')
WHERE 
    jersey_num IS NULL;


-- Pasamos de 110191 a 110191