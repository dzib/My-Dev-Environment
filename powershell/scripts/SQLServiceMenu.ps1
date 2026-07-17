# SQLServiceMenu.ps1 | v1.2.0 | - Menú persistente con auto-elevación
$ServiceName = "MSSQLSERVER"
$logDir = "D:\01.Datos_AlbertoDzib\02.Logs_Locales\00.LogSQLs"
$logPath = Join-Path $logDir "SQL_Service_Log.md"

# --- ASEGURAR DIRECTORIO DE LOGS ---
if (!(Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir }

# --- BLOQUE DE AUTO-ELEVACIÓN ---
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "⚠️ Se requieren privilegios de administrador para gestionar servicios." -ForegroundColor Yellow
    Write-Host "Relanzando el script con privilegios elevados..." -ForegroundColor Cyan
    Start-Process powershell -Verb RunAs -ArgumentList "-File `"$PSCommandPath`""
    exit
}

# --- FUNCIONES ---
function Write-Log {
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logPath -Value "### $timestamp `n- $message"
}

# --- MENÚ PRINCIPAL ---
function Show-Menu {
    $service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
    Write-Host "`n--- SQL Server Management [v1.2.0] ---" -ForegroundColor Yellow
    Write-Host "Estado actual: $($service.Status)" -ForegroundColor Cyan
    Write-Host "1. Iniciar | 2. Detener | 3. Toggle | 4. Salir" -ForegroundColor Gray
}

# --- LÓGICA PRINCIPAL ---
do {
    Show-Menu
    $choice = Read-Host "Selecciona una opción"
    switch ($choice) {
        "1" { 
            try { Start-Service -Name $ServiceName; Write-Log "Iniciado"; Write-Host "✅" -ForegroundColor Green }
            catch { Write-Host "Error al iniciar el servicio: $_" -ForegroundColor Red }
        }
        "2" { 
            try { Stop-Service -Name $ServiceName -Force; Write-Log "Detenido"; Write-Host "❌" -ForegroundColor Yellow }
            catch { Write-Host "Error al detener el servicio: $_" -ForegroundColor Red }
        }
        "3" { 
            $s = Get-Service -Name $ServiceName
            if ($s.Status -eq 'Running') { Stop-Service -Name $ServiceName -Force; Write-Log "Toggle: Detenido" }
            else { Start-Service -Name $ServiceName; Write-Log "Toggle: Iniciado" }
            exit 
        }
        "4" { Write-Host "Saliendo del gestor..." -ForegroundColor Gray }
        Default { Write-Host "Opción no válida." -ForegroundColor Red }
    }
} while ($choice -ne "4")

# --------------------------------------