-- 13. Limpieza team_details


SELECT * FROM team_details

-- Ver las columnas que tenemos

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'team_details ';


-- Validar la cantidad de nulos por columna

SELECT
    COUNT(CASE WHEN team_id IS NULL THEN 1 END) AS null_team_id,
    COUNT(CASE WHEN abbreviation IS NULL THEN 1 END) AS null_abbreviation,
    COUNT(CASE WHEN nickname IS NULL THEN 1 END) AS null_nickname,
    COUNT(CASE WHEN yearfounded IS NULL THEN 1 END) AS null_yearfounded,
    COUNT(CASE WHEN city IS NULL THEN 1 END) AS null_city,
    COUNT(CASE WHEN arena IS NULL THEN 1 END) AS null_arena,
    COUNT(CASE WHEN arenacapacity IS NULL THEN 1 END) AS null_arenacapacity,
    COUNT(CASE WHEN owner IS NULL THEN 1 END) AS null_owner,
    COUNT(CASE WHEN generalmanager IS NULL THEN 1 END) AS null_generalmanager,
    COUNT(CASE WHEN headcoach IS NULL THEN 1 END) AS null_headcoach,
    COUNT(CASE WHEN dleagueaffiliation IS NULL THEN 1 END) AS null_dleagueaffiliation,
    COUNT(CASE WHEN facebook IS NULL THEN 1 END) AS null_facebook,
    COUNT(CASE WHEN instagram IS NULL THEN 1 END) AS null_instagram,
    COUNT(CASE WHEN twitter IS NULL THEN 1 END) AS null_twitter
FROM team_details;


-- Rellenar valores nulos

UPDATE team_details
SET arenacapacity = 19309
WHERE team_id = 1610612743 AND arenacapacity IS NULL;

UPDATE team_details
SET arenacapacity = 18064
WHERE team_id = 1610612744 AND arenacapacity IS NULL;

UPDATE team_details
SET arenacapacity = 17732
WHERE team_id = 1610612751 AND arenacapacity IS NULL;

UPDATE team_details
SET arenacapacity = 21600
WHERE team_id = 1610612755 AND arenacapacity IS NULL;

UPDATE team_details
SET arenacapacity = 18422
WHERE team_id = 1610612756 AND arenacapacity IS NULL;

UPDATE team_details
SET arenacapacity = 18203
WHERE team_id = 1610612760 AND arenacapacity IS NULL;

UPDATE team_details
SET arenacapacity = 19800
WHERE team_id = 1610612761 AND arenacapacity IS NULL;

UPDATE team_details
SET arenacapacity = 18306
WHERE team_id = 1610612762 AND arenacapacity IS NULL;

UPDATE team_details
SET arenacapacity = 20332
WHERE team_id = 1610612765 AND arenacapacity IS NULL;

UPDATE team_details
SET headcoach = 'Nick Nurse'
WHERE team_id = 1610612761 AND headcoach IS NULL;
