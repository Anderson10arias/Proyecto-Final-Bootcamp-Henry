-- 8. Limpieza line_score

SELECT * FROM line_score

-- Eliminar todos los datos de partidos antes del 2012

DELETE FROM line_score
WHERE game_date_est < '2012-01-01';

-- Pasamos de 58053 a 13435 donde 'game_date_est' >= 2012

-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'line_score ';


-- Validar la cantidad de nulos por columna

SELECT
    COUNT(CASE WHEN game_date_est IS NULL THEN 1 END) AS null_game_date_est,
    COUNT(CASE WHEN game_sequence IS NULL THEN 1 END) AS null_game_sequence,
    COUNT(CASE WHEN game_id IS NULL THEN 1 END) AS null_game_id,
    COUNT(CASE WHEN team_id_home IS NULL THEN 1 END) AS null_team_id_home,
    COUNT(CASE WHEN team_abbreviation_home IS NULL THEN 1 END) AS null_team_abbreviation_home,
    COUNT(CASE WHEN team_city_name_home IS NULL THEN 1 END) AS null_team_city_name_home,
    COUNT(CASE WHEN team_nickname_home IS NULL THEN 1 END) AS null_team_nickname_home,
    COUNT(CASE WHEN team_wins_losses_home IS NULL THEN 1 END) AS null_team_wins_losses_home,
    COUNT(CASE WHEN pts_qtr1_home IS NULL THEN 1 END) AS null_pts_qtr1_home,
    COUNT(CASE WHEN pts_qtr2_home IS NULL THEN 1 END) AS null_pts_qtr2_home,
    COUNT(CASE WHEN pts_qtr3_home IS NULL THEN 1 END) AS null_pts_qtr3_home,
    COUNT(CASE WHEN pts_qtr4_home IS NULL THEN 1 END) AS null_pts_qtr4_home,
    COUNT(CASE WHEN pts_ot1_home IS NULL THEN 1 END) AS null_pts_ot1_home,
    COUNT(CASE WHEN pts_ot2_home IS NULL THEN 1 END) AS null_pts_ot2_home,
    COUNT(CASE WHEN pts_ot3_home IS NULL THEN 1 END) AS null_pts_ot3_home,
    COUNT(CASE WHEN pts_ot4_home IS NULL THEN 1 END) AS null_pts_ot4_home,
    COUNT(CASE WHEN pts_ot5_home IS NULL THEN 1 END) AS null_pts_ot5_home,
    COUNT(CASE WHEN pts_ot6_home IS NULL THEN 1 END) AS null_pts_ot6_home,
    COUNT(CASE WHEN pts_ot7_home IS NULL THEN 1 END) AS null_pts_ot7_home,
    COUNT(CASE WHEN pts_ot8_home IS NULL THEN 1 END) AS null_pts_ot8_home,
    COUNT(CASE WHEN pts_ot9_home IS NULL THEN 1 END) AS null_pts_ot9_home,
    COUNT(CASE WHEN pts_ot10_home IS NULL THEN 1 END) AS null_pts_ot10_home,
    COUNT(CASE WHEN pts_home IS NULL THEN 1 END) AS null_pts_home,
    COUNT(CASE WHEN team_id_away IS NULL THEN 1 END) AS null_team_id_away,
    COUNT(CASE WHEN team_abbreviation_away IS NULL THEN 1 END) AS null_team_abbreviation_away,
    COUNT(CASE WHEN team_city_name_away IS NULL THEN 1 END) AS null_team_city_name_away,
    COUNT(CASE WHEN team_nickname_away IS NULL THEN 1 END) AS null_team_nickname_away,
    COUNT(CASE WHEN team_wins_losses_away IS NULL THEN 1 END) AS null_team_wins_losses_away,
    COUNT(CASE WHEN pts_qtr1_away IS NULL THEN 1 END) AS null_pts_qtr1_away,
    COUNT(CASE WHEN pts_qtr2_away IS NULL THEN 1 END) AS null_pts_qtr2_away,
    COUNT(CASE WHEN pts_qtr3_away IS NULL THEN 1 END) AS null_pts_qtr3_away,
    COUNT(CASE WHEN pts_qtr4_away IS NULL THEN 1 END) AS null_pts_qtr4_away,
    COUNT(CASE WHEN pts_ot1_away IS NULL THEN 1 END) AS null_pts_ot1_away,
    COUNT(CASE WHEN pts_ot2_away IS NULL THEN 1 END) AS null_pts_ot2_away,
    COUNT(CASE WHEN pts_ot3_away IS NULL THEN 1 END) AS null_pts_ot3_away,
    COUNT(CASE WHEN pts_ot4_away IS NULL THEN 1 END) AS null_pts_ot4_away,
    COUNT(CASE WHEN pts_ot5_away IS NULL THEN 1 END) AS null_pts_ot5_away,
    COUNT(CASE WHEN pts_ot6_away IS NULL THEN 1 END) AS null_pts_ot6_away,
    COUNT(CASE WHEN pts_ot7_away IS NULL THEN 1 END) AS null_pts_ot7_away,
    COUNT(CASE WHEN pts_ot8_away IS NULL THEN 1 END) AS null_pts_ot8_away,
    COUNT(CASE WHEN pts_ot9_away IS NULL THEN 1 END) AS null_pts_ot9_away,
    COUNT(CASE WHEN pts_ot10_away IS NULL THEN 1 END) AS null_pts_ot10_away,
    COUNT(CASE WHEN pts_away IS NULL THEN 1 END) AS null_pts_away
FROM line_score;


-- Eliminar las columnas que no necesitaremos

ALTER TABLE line_score
DROP COLUMN pts_ot1_home, pts_ot2_home, pts_ot3_home, pts_ot4_home, pts_ot5_home, pts_ot6_home, pts_ot7_home, pts_ot8_home,
			pts_ot9_home, pts_ot10_home, pts_ot1_away, pts_ot2_away, pts_ot3_away, pts_ot4_away, pts_ot5_away, pts_ot6_away,
			pts_ot7_away, pts_ot8_away, pts_ot9_away, pts_ot10_away;


-- Validar otra vez columnas con nulos

SELECT
    COUNT(CASE WHEN game_date_est IS NULL THEN 1 END) AS null_game_date_est,
    COUNT(CASE WHEN game_sequence IS NULL THEN 1 END) AS null_game_sequence,
    COUNT(CASE WHEN game_id IS NULL THEN 1 END) AS null_game_id,
    COUNT(CASE WHEN team_id_home IS NULL THEN 1 END) AS null_team_id_home,
    COUNT(CASE WHEN team_abbreviation_home IS NULL THEN 1 END) AS null_team_abbreviation_home,
    COUNT(CASE WHEN team_city_name_home IS NULL THEN 1 END) AS null_team_city_name_home,
    COUNT(CASE WHEN team_nickname_home IS NULL THEN 1 END) AS null_team_nickname_home,
    COUNT(CASE WHEN team_wins_losses_home IS NULL THEN 1 END) AS null_team_wins_losses_home,
    COUNT(CASE WHEN pts_qtr1_home IS NULL THEN 1 END) AS null_pts_qtr1_home,
    COUNT(CASE WHEN pts_qtr2_home IS NULL THEN 1 END) AS null_pts_qtr2_home,
    COUNT(CASE WHEN pts_qtr3_home IS NULL THEN 1 END) AS null_pts_qtr3_home,
    COUNT(CASE WHEN pts_qtr4_home IS NULL THEN 1 END) AS null_pts_qtr4_home,
    COUNT(CASE WHEN pts_home IS NULL THEN 1 END) AS null_pts_home,
    COUNT(CASE WHEN team_id_away IS NULL THEN 1 END) AS null_team_id_away,
    COUNT(CASE WHEN team_abbreviation_away IS NULL THEN 1 END) AS null_team_abbreviation_away,
    COUNT(CASE WHEN team_city_name_away IS NULL THEN 1 END) AS null_team_city_name_away,
    COUNT(CASE WHEN team_nickname_away IS NULL THEN 1 END) AS null_team_nickname_away,
    COUNT(CASE WHEN team_wins_losses_away IS NULL THEN 1 END) AS null_team_wins_losses_away,
    COUNT(CASE WHEN pts_qtr1_away IS NULL THEN 1 END) AS null_pts_qtr1_away,
    COUNT(CASE WHEN pts_qtr2_away IS NULL THEN 1 END) AS null_pts_qtr2_away,
    COUNT(CASE WHEN pts_qtr3_away IS NULL THEN 1 END) AS null_pts_qtr3_away,
    COUNT(CASE WHEN pts_qtr4_away IS NULL THEN 1 END) AS null_pts_qtr4_away,
    COUNT(CASE WHEN pts_away IS NULL THEN 1 END) AS null_pts_away
FROM line_score;
