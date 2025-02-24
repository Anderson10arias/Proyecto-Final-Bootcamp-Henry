-- 2. Limpieza draft_combine_stats

SELECT * FROM draft_combine_stats

-- Eliminamos las columnas que no necesitaremos

ALTER TABLE draft_combine_stats
DROP COLUMN spot_fifteen_corner_left, spot_fifteen_break_left, spot_fifteen_top_key, spot_fifteen_break_right,
			spot_fifteen_corner_right, spot_college_corner_left, spot_college_break_left, spot_college_top_key,
			spot_college_break_right, spot_college_corner_right, spot_nba_corner_left, spot_nba_break_left, spot_nba_top_key,
			spot_nba_break_right, spot_nba_corner_right, off_drib_fifteen_break_left, off_drib_fifteen_top_key,
			off_drib_fifteen_break_right, off_drib_college_break_left, off_drib_college_top_key, off_drib_college_break_right,
			on_move_fifteen, on_move_college, modified_lane_agility_time, hand_width, hand_length, bench_press,
			height_wo_shoes , height_wo_shoes_ft_in, height_w_shoes, height_w_shoes_ft_in, weight, wingspan, wingspan_ft_in,
			standing_reach, standing_reach_ft_in, body_fat_pct, standing_vertical_leap, max_vertical_leap, lane_agility_time,
			three_quarter_sprint;
	
-- Ver las columnas que quedaron
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'draft_combine_stats';


-- Validar la cantidad de nulos

SELECT 
    COUNT(CASE WHEN season IS NULL THEN 1 END) AS null_season,
    COUNT(CASE WHEN player_id IS NULL THEN 1 END) AS null_player_id,
    COUNT(CASE WHEN first_name IS NULL THEN 1 END) AS null_first_name,
    COUNT(CASE WHEN last_name IS NULL THEN 1 END) AS null_last_name,
    COUNT(CASE WHEN player_name IS NULL THEN 1 END) AS null_player_name,
    COUNT(CASE WHEN position IS NULL THEN 1 END) AS null_position
FROM draft_combine_stats;

--- Actualizar los valores nulos en la columna position con la moda
UPDATE draft_combine_stats
SET position = (
    SELECT TOP 1 position
    FROM draft_combine_stats
    WHERE position IS NOT NULL
    GROUP BY position
    ORDER BY COUNT(*) DESC
)
WHERE position IS NULL;

-- Eliminar las filas donde 'season' es menor a 2012
DELETE FROM draft_combine_stats
WHERE season < 2012;

-- Eliminar fila duplicada 
DELETE FROM draft_combine_stats
WHERE season = 2023 AND player_id = 1631173;

-- Pasamos de 1202 a 656 filas filtradas por 'season' >= 2012
SELECT *
FROM draft_combine_stats