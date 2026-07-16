# Script de configuración del entorno
Write-Host "🚀 Instalando configuración de entorno..." -ForegroundColor Green

# 1. Crear carpeta de lenguajes si no existe
if (!(Test-Path "D:\Dev\Languages")) {
    New-Item -ItemType Directory -Path "D:\Dev\Languages" -Force
    Write-Host "✔ Carpeta D:\Dev\Languages creada" -ForegroundColor Cyan
}

# 2. Copiar perfil de PowerShell de manera segura
$ProfilePath = "$PROFILE"
$ProfileDir = Split-Path -Parent $ProfilePath
$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# Asegurar que la carpeta del perfil en el sistema existe
if (!(Test-Path $ProfileDir)) {
    New-Item -ItemType Directory -Path $ProfileDir -Force
}

# Subir un nivel para encontrar el perfil (..\Microsoft.PowerShell_profile.ps1)
Copy-Item "$ScriptPath\..\Microsoft.PowerShell_profile.ps1" -Destination $ProfilePath -Force
Write-Host "✔ Perfil de PowerShell actualizado en $ProfilePath" -ForegroundColor Cyan

# 3. Copiar settings.json de VS Code de manera segura
$VSCodePath = "$env:APPDATA\Code\User\settings.json"
$VSCodeDir = Split-Path -Parent $VSCodePath

if (!(Test-Path $VSCodeDir)) {
    New-Item -ItemType Directory -Path $VSCodeDir -Force
}

# Subir dos niveles para llegar a la raíz y entrar a .vscode
Copy-Item "$ScriptPath\..\..\.vscode\settings.json" -Destination $VSCodePath -Force
Write-Host "✔ Configuración de VS Code actualizada" -ForegroundColor Cyan

Write-Host "✨ ¡Entorno configurado exitosamente!" -ForegroundColor Green