@echo off
REM === Exécution automatique de macrobus_entrepot.sql ===

REM → Configuration
SET PGPASSWORD=2002
psql -U postgres -h localhost -p 5432 -d macrobus_entrepot -f "C:\Users\User\Desktop\Macrobus_project\entrepot_donnee\entrepot_scrypt.sql"

pause
