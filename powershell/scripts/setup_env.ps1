# Script de configuración del entorno
Write-Host "Instalando configuración de entorno..." -ForegroundColor Green

# Crear carpetas si no existen
if (!(Test-Path "D:\Dev\Languages")) {
    New-Item -ItemType Directory -Path "D:\Dev\Languages" -Force
    Write-Host "✓ Carpeta D:\Dev\Languages creada" -ForegroundColor Cyan
}

# Copiar perfil de PowerShell
$ProfilePath = "$PROFILE"
$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Copy-Item "$ScriptPath\Microsoft.PowerShell_profile.ps1" -Destination $ProfilePath -Force
Write-Host "✓ Perfil de PowerShell actualizado" -ForegroundColor Cyan

# Copiar settings.json de VS Code
$VSCodePath = "$env:APPDATA\Code\User\settings.json"
Copy-Item "$(Split-Path -Parent $ScriptPath)\..\..vscode\settings.json" -Destination $VSCodePath -Force
Write-Host "✓ Configuración de VS Code actualizada" -ForegroundColor Cyan

Write-Host "¡Entorno configurado exitosamente!" -ForegroundColor Green