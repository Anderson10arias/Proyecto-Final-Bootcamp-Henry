-- 3. Limpieza draft_history

SELECT * FROM draft_history

-- Ver las columnas
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'draft_history ';


-- Validar la cantidad de nulos
SELECT 
    COUNT(CASE WHEN person_id IS NULL THEN 1 END) AS null_person_id,
    COUNT(CASE WHEN player_name IS NULL THEN 1 END) AS null_player_name,
    COUNT(CASE WHEN season IS NULL THEN 1 END) AS null_season,
    COUNT(CASE WHEN round_number IS NULL THEN 1 END) AS null_round_number,
    COUNT(CASE WHEN round_pick IS NULL THEN 1 END) AS null_round_pick,
    COUNT(CASE WHEN overall_pick IS NULL THEN 1 END) AS null_overall_pick,
    COUNT(CASE WHEN draft_type IS NULL THEN 1 END) AS null_draft_type,
    COUNT(CASE WHEN team_id IS NULL THEN 1 END) AS null_team_id,
    COUNT(CASE WHEN team_city IS NULL THEN 1 END) AS null_team_city,
    COUNT(CASE WHEN team_name IS NULL THEN 1 END) AS null_team_name,
    COUNT(CASE WHEN team_abbreviation IS NULL THEN 1 END) AS null_team_abbreviation,
    COUNT(CASE WHEN organization IS NULL THEN 1 END) AS null_organization,
    COUNT(CASE WHEN organization_type IS NULL THEN 1 END) AS null_organization_type,
    COUNT(CASE WHEN player_profile_flag IS NULL THEN 1 END) AS null_player_profile_flag
FROM draft_history;


-- Rellenar valores Nulos en organization y organization_type

UPDATE draft_history
SET 
	organization = ISNULL(organization, 'NA'),
	organization_type = ISNULL(organization_type, 'NA')
	
WHERE 
    organization IS NULL 
    OR organization_type IS NULL;


-- Eliminar las filas donde 'season' es menor a 2012
DELETE FROM draft_history
WHERE season < 2012;


-- Pasamos de 7990  a 656 filas filtradas por 'season' >= 2012