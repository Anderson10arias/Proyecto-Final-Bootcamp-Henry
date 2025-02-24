-- 1. LIMPIEZA common_player_info

-- Crear una copia de seguridad de la tabla
SELECT * INTO common_player_info_backup
FROM common_player_info;

-- Iniciar una transacción
BEGIN TRANSACTION;

-- Confirmar la transacción
COMMIT TRANSACTION;

------------------------------------------------------------------

-- Eliminar las filas donde from_year es menor a 2012
DELETE FROM common_player_info
WHERE to_year < 2012;


-- Rellenar valores nulos

UPDATE common_player_info
SET 
	school = ISNULL(school, 'NA'),
	jersey = ISNULL(jersey, '0'),
	team_name = ISNULL(team_name, 'NA'),
	team_abbreviation = ISNULL(team_abbreviation, 'NA'),
	team_code = ISNULL(team_code, 'NA'),
	team_city = ISNULL(team_city, 'NA'),
	draft_round = ISNULL(draft_round, '0'),
	draft_number = ISNULL(draft_number, '0')
WHERE 
    school IS NULL 
    OR jersey IS NULL 
    OR team_name IS NULL
	OR team_abbreviation IS NULL
	OR team_code IS NULL
	OR team_city IS NULL
	OR draft_round IS NULL
	OR draft_number IS NULL;


-- Actualizar los valores nulos en la columna height con la moda

UPDATE common_player_info
SET height = (
    SELECT TOP 1 height
    FROM common_player_info
    WHERE height IS NOT NULL
    GROUP BY height
    ORDER BY COUNT(*) DESC
)
WHERE height IS NULL;



-- Actualizar los valores nulos en la columna weight con la media sin decimales.

UPDATE common_player_info
SET weight = (SELECT ROUND(AVG(weight), 0) FROM common_player_info)
WHERE weight IS NULL;


-- Actualizar los valores nulos en la columna position con la moda

UPDATE common_player_info
SET position = (
    SELECT TOP 1 position
    FROM common_player_info
    WHERE position IS NOT NULL
    GROUP BY position
    ORDER BY COUNT(*) DESC
)
WHERE position IS NULL;


-- Eliminar las filas donde la columna from_year es valor NULL

DELETE FROM common_player_info
WHERE from_year IS NULL;


-- Validar la cantidad de nulos

SELECT
    COUNT(CASE WHEN person_id IS NULL THEN 1 END) AS null_person_id,
    COUNT(CASE WHEN first_name IS NULL THEN 1 END) AS null_first_name,
    COUNT(CASE WHEN last_name IS NULL THEN 1 END) AS null_last_name,
    COUNT(CASE WHEN display_first_last IS NULL THEN 1 END) AS null_display_first_last,
    COUNT(CASE WHEN display_last_comma_first IS NULL THEN 1 END) AS null_display_last_comma_first,
    COUNT(CASE WHEN display_fi_last IS NULL THEN 1 END) AS null_display_fi_last,
    COUNT(CASE WHEN player_slug IS NULL THEN 1 END) AS null_player_slug,
    COUNT(CASE WHEN birthdate IS NULL THEN 1 END) AS null_birthdate,
    COUNT(CASE WHEN school IS NULL THEN 1 END) AS null_school,
    COUNT(CASE WHEN country IS NULL THEN 1 END) AS null_country,
    COUNT(CASE WHEN last_affiliation IS NULL THEN 1 END) AS null_last_affiliation,
    COUNT(CASE WHEN height IS NULL THEN 1 END) AS null_height,
    COUNT(CASE WHEN weight IS NULL THEN 1 END) AS null_weight,
    COUNT(CASE WHEN season_exp IS NULL THEN 1 END) AS null_season_exp,
    COUNT(CASE WHEN jersey IS NULL THEN 1 END) AS null_jersey,
    COUNT(CASE WHEN position IS NULL THEN 1 END) AS null_position,
    COUNT(CASE WHEN rosterstatus IS NULL THEN 1 END) AS null_rosterstatus,
    COUNT(CASE WHEN games_played_current_season_flag IS NULL THEN 1 END) AS null_games_played_current_season_flag,
    COUNT(CASE WHEN team_id IS NULL THEN 1 END) AS null_team_id,
    COUNT(CASE WHEN team_name IS NULL THEN 1 END) AS null_team_name,
    COUNT(CASE WHEN team_abbreviation IS NULL THEN 1 END) AS null_team_abbreviation,
    COUNT(CASE WHEN team_code IS NULL THEN 1 END) AS null_team_code,
    COUNT(CASE WHEN team_city IS NULL THEN 1 END) AS null_team_city,
    COUNT(CASE WHEN playercode IS NULL THEN 1 END) AS null_playercode,
    COUNT(CASE WHEN from_year IS NULL THEN 1 END) AS null_from_year,
    COUNT(CASE WHEN to_year IS NULL THEN 1 END) AS null_to_year,
    COUNT(CASE WHEN dleague_flag IS NULL THEN 1 END) AS null_dleague_flag,
    COUNT(CASE WHEN nba_flag IS NULL THEN 1 END) AS null_nba_flag,
    COUNT(CASE WHEN games_played_flag IS NULL THEN 1 END) AS null_games_played_flag,
    COUNT(CASE WHEN draft_year IS NULL THEN 1 END) AS null_draft_year,
    COUNT(CASE WHEN draft_round IS NULL THEN 1 END) AS null_draft_round,
    COUNT(CASE WHEN draft_number IS NULL THEN 1 END) AS null_draft_number,
    COUNT(CASE WHEN greatest_75_flag IS NULL THEN 1 END) AS null_greatest_75_flag
FROM common_player_info;


-- Pasamos de 4171 a 1278 filas filtradas por 'to_year'

SELECT * FROM common_player_info

-- Ver las columnas que quedaron

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'common_player_info';