-- 6. Limpieza game_summary

SELECT * FROM game_summary

-- Eliminar todos los datos de partidos antes del 2012

DELETE FROM game_summary
WHERE game_date_est < '2012-01-01';

-- Pasamos de 58110 a 13484 donde 'game_date_est' >= 2012

-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'game_summary ';

-- Eliminar las columnas que no necesitaremos

ALTER TABLE game_summary
DROP COLUMN live_pc_time, natl_tv_broadcaster_abbreviation;

-- Validar la cantidad de nulos

SELECT
    COUNT(CASE WHEN game_date_est IS NULL THEN 1 END) AS null_game_date_est,
    COUNT(CASE WHEN game_sequence IS NULL THEN 1 END) AS null_game_sequence,
    COUNT(CASE WHEN game_id IS NULL THEN 1 END) AS null_game_id,
    COUNT(CASE WHEN game_status_id IS NULL THEN 1 END) AS null_game_status_id,
	COUNT(CASE WHEN game_status_text IS NULL THEN 1 END) AS null_game_status_text,
	COUNT(CASE WHEN gamecode IS NULL THEN 1 END) AS null_gamecode,
	COUNT(CASE WHEN home_team_id IS NULL THEN 1 END) AS null_home_team_id,
	COUNT(CASE WHEN visitor_team_id IS NULL THEN 1 END) AS null_visitor_team_id,
	COUNT(CASE WHEN season IS NULL THEN 1 END) AS null_season,
	COUNT(CASE WHEN live_period IS NULL THEN 1 END) AS null_live_period,
	COUNT(CASE WHEN live_period_time_bcast IS NULL THEN 1 END) AS null_live_period_time_bcast,
	COUNT(CASE WHEN wh_status IS NULL THEN 1 END) AS null_wh_status
FROM game_summary;

SELECT * FROM game_summary

