-- 10. Limpieza other_stats

SELECT *FROM other_stats

-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'other_stats ';


-- Validar la cantidad de nulos por columna

SELECT *FROM other_stats
SELECT
    COUNT(CASE WHEN game_id IS NULL THEN 1 END) AS null_game_id,
    COUNT(CASE WHEN league_id IS NULL THEN 1 END) AS null_league_id,
    COUNT(CASE WHEN team_id_home IS NULL THEN 1 END) AS null_team_id_home,
    COUNT(CASE WHEN team_abbreviation_home IS NULL THEN 1 END) AS null_team_abbreviation_home,
    COUNT(CASE WHEN team_city_home IS NULL THEN 1 END) AS null_team_city_home,
    COUNT(CASE WHEN pts_paint_home IS NULL THEN 1 END) AS null_pts_paint_home,
    COUNT(CASE WHEN pts_2nd_chance_home IS NULL THEN 1 END) AS null_pts_2nd_chance_home,
    COUNT(CASE WHEN pts_fb_home IS NULL THEN 1 END) AS null_pts_fb_home,
    COUNT(CASE WHEN largest_lead_home IS NULL THEN 1 END) AS null_largest_lead_home,
    COUNT(CASE WHEN lead_changes IS NULL THEN 1 END) AS null_lead_changes,
    COUNT(CASE WHEN times_tied IS NULL THEN 1 END) AS null_times_tied,
    COUNT(CASE WHEN team_turnovers_home IS NULL THEN 1 END) AS null_team_turnovers_home,
    COUNT(CASE WHEN total_turnovers_home IS NULL THEN 1 END) AS null_total_turnovers_home,
    COUNT(CASE WHEN team_rebounds_home IS NULL THEN 1 END) AS null_team_rebounds_home,
    COUNT(CASE WHEN pts_off_to_home IS NULL THEN 1 END) AS null_pts_off_to_home,
    COUNT(CASE WHEN team_id_away IS NULL THEN 1 END) AS null_team_id_away,
    COUNT(CASE WHEN team_abbreviation_away IS NULL THEN 1 END) AS null_team_abbreviation_away,
    COUNT(CASE WHEN team_city_away IS NULL THEN 1 END) AS null_team_city_away,
    COUNT(CASE WHEN pts_paint_away IS NULL THEN 1 END) AS null_pts_paint_away,
    COUNT(CASE WHEN pts_2nd_chance_away IS NULL THEN 1 END) AS null_pts_2nd_chance_away,
    COUNT(CASE WHEN pts_fb_away IS NULL THEN 1 END) AS null_pts_fb_away,
    COUNT(CASE WHEN largest_lead_away IS NULL THEN 1 END) AS null_largest_lead_away,
    COUNT(CASE WHEN team_turnovers_away IS NULL THEN 1 END) AS null_team_turnovers_away,
    COUNT(CASE WHEN total_turnovers_away IS NULL THEN 1 END) AS null_total_turnovers_away,
    COUNT(CASE WHEN team_rebounds_away IS NULL THEN 1 END) AS null_team_rebounds_away,
    COUNT(CASE WHEN pts_off_to_away IS NULL THEN 1 END) AS null_pts_off_to_away
FROM other_stats;


-- Rellenar valores nulos

UPDATE other_stats
SET 
    team_turnovers_home = ISNULL(team_turnovers_home, '0'),
    total_turnovers_home = ISNULL(total_turnovers_home, '0'),
    team_rebounds_home = ISNULL(team_rebounds_home, '0'),
    pts_off_to_home = ISNULL(pts_off_to_home, '0'),
    team_turnovers_away = ISNULL(team_turnovers_away, '0'),
    total_turnovers_away = ISNULL(total_turnovers_away, '0'),
    team_rebounds_away = ISNULL(team_rebounds_away, '0'),
    pts_off_to_away = ISNULL(pts_off_to_away, '0')
WHERE 
    team_turnovers_home IS NULL OR
    total_turnovers_home IS NULL OR
    team_rebounds_home IS NULL OR
    pts_off_to_home IS NULL OR
    team_turnovers_away IS NULL OR
    total_turnovers_away IS NULL OR
    team_rebounds_away IS NULL OR
    pts_off_to_away IS NULL;
