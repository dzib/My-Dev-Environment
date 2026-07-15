# 1. Limpieza inicial
if (Test-Path Alias:\r) { Remove-Item Alias:\r -Force -ErrorAction SilentlyContinue }

# 2. Alias de desarrollo
Set-Alias runr "D:\Dev\Languages\R-4.6.1\bin\x64\R.exe"

# 3. Configuración de lectura de línea
Set-PSReadLineOption -EditMode Windows

# 4. Mensaje de bienvenida
Write-Host "Entorno de Desarrollo [dzib] cargado correctamente." -ForegroundColor Cyan