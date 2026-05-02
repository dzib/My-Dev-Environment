# SQLServiceMenu_v1.ps1
$serviceName = "MSSQLSERVER"
$logPath = "C:\Users\Public\SQLService_Menu_Log.md"

function Write-Log {
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $entry = "`n### $timestamp`n- $message"
    Add-Content -Path $logPath -Value $entry
}

function Show-Menu {
    Clear-Host
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($null -eq $service) {
        Write-Host "❌ No se encontró el servicio $serviceName"
        Write-Log "Error: No se encontró el servicio $serviceName"
        return
    }

    Write-Host "====================================="
    Write-Host "   Control de SQL Server ($serviceName)"
    Write-Host "   Estado actual: $($service.Status)"
    Write-Log "Estado actual: $($service.Status)"
    Write-Host "====================================="
    Write-Host "1. Iniciar servicio"
    Write-Host "2. Detener servicio"
    Write-Host "3. Alternar estado (On/Off)"
    Write-Host "4. Salir"
    Write-Host "====================================="
}

function Start-SQL {
    Start-Service -Name $serviceName
    Write-Log "🟢 Servicio $serviceName iniciado."
    Write-Host "🟢 SQL Server iniciado."
}

function Stop-SQL {
    Stop-Service -Name $serviceName -Force
    Write-Log "🔴 Servicio $serviceName detenido."
    Write-Host "🔴 SQL Server detenido."
}

function Toggle-SQL {
    $service = Get-Service -Name $serviceName
    if ($service.Status -eq "Running") {
        Stop-SQL
    } else {
        Start-SQL
    }
}

do {
    Show-Menu
    $choice = Read-Host "Selecciona una opción (1-4)"

    switch ($choice) {
        "1" { Start-SQL }
        "2" { Stop-SQL }
        "3" { Toggle-SQL }
        "4" { Write-Host "👋 Saliendo..."; break }
        default { Write-Host "⚠ Opción inválida, intenta de nuevo." }
    }

    if ($choice -ne "4") {
        Write-Host "`nPresiona Enter para continuar..."
        Read-Host
    }
} while ($choice -ne "4")
