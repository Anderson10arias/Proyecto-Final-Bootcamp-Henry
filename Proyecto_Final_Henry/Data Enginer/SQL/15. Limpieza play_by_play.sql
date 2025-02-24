-- 15. Limpieza play_by_play

SELECT * FROM play_by_play

-- Eliminar las filas donde la columna player1_team_id es valor NULL

DELETE FROM play_by_play
WHERE player1_team_id IS NULL;

Pasamos de de 3.564.463

-- Pasamos de 3'564.463 a 3'334.571 filas.