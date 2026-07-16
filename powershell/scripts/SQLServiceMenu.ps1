# SQLServiceMenu.ps1 - Menú persistente con auto-elevación
$ServiceName = "MSSQLSERVER"

# --- BLOQUE DE AUTO-ELEVACIÓN ---
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "⚠️ Se requieren privilegios de administrador para gestionar servicios." -ForegroundColor Yellow
    Write-Host "Relanzando el script con privilegios elevados..." -ForegroundColor Cyan
    Start-Process powershell -Verb RunAs -ArgumentList "-File `"$PSCommandPath`""
    exit
}

# --- MENÚ PRINCIPAL ---
$option = ""
do {
    Write-Host "`n--- SQL Server Management ---" -ForegroundColor Yellow
    Write-Host "1. Iniciar SQL Server" -ForegroundColor Green
    Write-Host "2. Detener SQL Server" -ForegroundColor Red
    Write-Host "3. Estado del Servicio" -ForegroundColor Cyan
    Write-Host "4. Cambiar estado (Toggle)" -ForegroundColor Magenta
    Write-Host "5. Salir" -ForegroundColor Gray

    $option = Read-Host "Selecciona una opción"
    $status = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

    switch ($option) {
        "1" { 
            try { Start-Service -Name $ServiceName -ErrorAction Stop; Write-Host "Servicio iniciado con éxito." -ForegroundColor Green }
            catch { Write-Host "Error al iniciar el servicio: $_" -ForegroundColor Red }
        }
        "2" { 
            try { Stop-Service -Name $ServiceName -Force -ErrorAction Stop; Write-Host "Servicio detenido con éxito." -ForegroundColor Yellow }
            catch { Write-Host "Error al detener el servicio: $_" -ForegroundColor Red }
        }
        "3" { 
            if ($status) { Write-Host "Estado actual: $($status.Status)" -ForegroundColor Cyan }
            else { Write-Host "No se pudo encontrar el servicio '$ServiceName'." -ForegroundColor Red }
        }
        "4" { 
            if ($status.Status -eq 'Running') {
                Stop-Service -Name $ServiceName -Force -Verbose
                Write-Host "Servicio detenido." -ForegroundColor Yellow
            }
            else {
                Start-Service -Name $ServiceName -Verbose
                Write-Host "Servicio iniciado." -ForegroundColor Green
            }
        }
        "5" { Write-Host "Saliendo del gestor..." -ForegroundColor Gray }
        Default { Write-Host "Opción no válida." -ForegroundColor Red }
    }
} while ($option -ne "5")