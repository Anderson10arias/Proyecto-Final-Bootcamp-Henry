-- 4. Limpieza game

SELECT * FROM game

-- Eliminar las columnas que no necesitamos

ALTER TABLE game
DROP COLUMN video_available_home, video_available_away;

-- Eliminar todos los datos de partidos antes del 2012

DELETE FROM game
WHERE game_date < '2012-01-01';


-- Pasamos de 65698 a 14762 donde 'game_date' >= 2012


-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'game ';


-- Validar la cantidad de nulos

SELECT 
    COUNT(CASE WHEN season_id IS NULL THEN 1 END) AS null_season_id,
    COUNT(CASE WHEN team_id_home IS NULL THEN 1 END) AS null_team_id_home,
    COUNT(CASE WHEN team_abbreviation_home IS NULL THEN 1 END) AS null_team_abbreviation_home,
    COUNT(CASE WHEN team_name_home IS NULL THEN 1 END) AS null_team_name_home,
    COUNT(CASE WHEN game_id IS NULL THEN 1 END) AS null_game_id,
    COUNT(CASE WHEN game_date IS NULL THEN 1 END) AS null_game_date,
    COUNT(CASE WHEN matchup_home IS NULL THEN 1 END) AS null_matchup_home,
    COUNT(CASE WHEN wl_home IS NULL THEN 1 END) AS null_wl_home,
    COUNT(CASE WHEN min IS NULL THEN 1 END) AS null_min,
    COUNT(CASE WHEN fgm_home IS NULL THEN 1 END) AS null_fgm_home,
    COUNT(CASE WHEN fga_home IS NULL THEN 1 END) AS null_fga_home,
    COUNT(CASE WHEN fg_pct_home IS NULL THEN 1 END) AS null_fg_pct_home,
    COUNT(CASE WHEN fg3m_home IS NULL THEN 1 END) AS null_fg3m_home,
    COUNT(CASE WHEN fg3a_home IS NULL THEN 1 END) AS null_fg3a_home,
    COUNT(CASE WHEN fg3_pct_home IS NULL THEN 1 END) AS null_fg3_pct_home,
    COUNT(CASE WHEN ftm_home IS NULL THEN 1 END) AS null_ftm_home,
    COUNT(CASE WHEN fta_home IS NULL THEN 1 END) AS null_fta_home,
    COUNT(CASE WHEN ft_pct_home IS NULL THEN 1 END) AS null_ft_pct_home,
    COUNT(CASE WHEN oreb_home IS NULL THEN 1 END) AS null_oreb_home,
    COUNT(CASE WHEN dreb_home IS NULL THEN 1 END) AS null_dreb_home,
    COUNT(CASE WHEN reb_home IS NULL THEN 1 END) AS null_reb_home,
    COUNT(CASE WHEN ast_home IS NULL THEN 1 END) AS null_ast_home,
    COUNT(CASE WHEN stl_home IS NULL THEN 1 END) AS null_stl_home,
    COUNT(CASE WHEN blk_home IS NULL THEN 1 END) AS null_blk_home,
    COUNT(CASE WHEN tov_home IS NULL THEN 1 END) AS null_tov_home,
    COUNT(CASE WHEN pf_home IS NULL THEN 1 END) AS null_pf_home,
    COUNT(CASE WHEN pts_home IS NULL THEN 1 END) AS null_pts_home,
    COUNT(CASE WHEN plus_minus_home IS NULL THEN 1 END) AS null_plus_minus_home,
    COUNT(CASE WHEN team_id_away IS NULL THEN 1 END) AS null_team_id_away,
    COUNT(CASE WHEN team_abbreviation_away IS NULL THEN 1 END) AS null_team_abbreviation_away,
    COUNT(CASE WHEN team_name_away IS NULL THEN 1 END) AS null_team_name_away,
    COUNT(CASE WHEN matchup_away IS NULL THEN 1 END) AS null_matchup_away,
    COUNT(CASE WHEN wl_away IS NULL THEN 1 END) AS null_wl_away,
    COUNT(CASE WHEN fgm_away IS NULL THEN 1 END) AS null_fgm_away,
    COUNT(CASE WHEN fga_away IS NULL THEN 1 END) AS null_fga_away,
    COUNT(CASE WHEN fg_pct_away IS NULL THEN 1 END) AS null_fg_pct_away,
    COUNT(CASE WHEN fg3m_away IS NULL THEN 1 END) AS null_fg3m_away,
    COUNT(CASE WHEN fg3a_away IS NULL THEN 1 END) AS null_fg3a_away,
    COUNT(CASE WHEN fg3_pct_away IS NULL THEN 1 END) AS null_fg3_pct_away,
    COUNT(CASE WHEN ftm_away IS NULL THEN 1 END) AS null_ftm_away,
    COUNT(CASE WHEN fta_away IS NULL THEN 1 END) AS null_fta_away,
    COUNT(CASE WHEN ft_pct_away IS NULL THEN 1 END) AS null_ft_pct_away,
    COUNT(CASE WHEN oreb_away IS NULL THEN 1 END) AS null_oreb_away,
    COUNT(CASE WHEN dreb_away IS NULL THEN 1 END) AS null_dreb_away,
    COUNT(CASE WHEN reb_away IS NULL THEN 1 END) AS null_reb_away,
    COUNT(CASE WHEN ast_away IS NULL THEN 1 END) AS null_ast_away,
    COUNT(CASE WHEN stl_away IS NULL THEN 1 END) AS null_stl_away,
    COUNT(CASE WHEN blk_away IS NULL THEN 1 END) AS null_blk_away,
    COUNT(CASE WHEN tov_away IS NULL THEN 1 END) AS null_tov_away,
    COUNT(CASE WHEN pf_away IS NULL THEN 1 END) AS null_pf_away,
    COUNT(CASE WHEN pts_away IS NULL THEN 1 END) AS null_pts_away,
    COUNT(CASE WHEN plus_minus_away IS NULL THEN 1 END) AS null_plus_minus_away,
    COUNT(CASE WHEN season_type IS NULL THEN 1 END) AS null_season_type
FROM game;																-- Tenemos 2 nullos en ft_pct_home(Porcentaje de tiros libres del equipo local)


-- Actualizar los valores nulos en la columna ft_pct_home con la moda
UPDATE game
SET ft_pct_home = (
    SELECT TOP 1 ft_pct_home
    FROM game
    WHERE ft_pct_home IS NOT NULL
    GROUP BY ft_pct_home
    ORDER BY COUNT(*) DESC
)
WHERE ft_pct_home IS NULL;