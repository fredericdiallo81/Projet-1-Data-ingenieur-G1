@echo off
SETLOCAL

REM === Configuration PostgreSQL ===
SET PGUSER=postgres
SET PGPASSWORD=2002
SET PGDATABASE=macrobus_entrepot
SET PGHOST=localhost
SET PGPORT=5432
SET SCRIPT=C:\Users\User\Desktop\Macrobus_project\chargement1\chargement1_filtre.sql

REM === Exécution ===
echo ===============================
echo Chargement des données en cours...
echo Base cible : %PGDATABASE%
echo Script utilisé : %SCRIPT%
echo ===============================

psql -U %PGUSER% -h %PGHOST% -p %PGPORT% -d %PGDATABASE% -f "%SCRIPT%"

IF %ERRORLEVEL% NEQ 0 (
    echo ❌ Une erreur est survenue pendant le chargement.
) ELSE (
    echo ✅ Chargement terminé avec succès.
)

pause
ENDLOCAL
