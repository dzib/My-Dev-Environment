@echo off
echo Deteniendo SQL Server para enfriar la PC...
net stop MSSQLSERVER /y
echo.
echo SQL Server se ha detenido con exito. El ventilador deberia calmarse.
pause
