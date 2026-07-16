# 🚀 Guía de Instalación - My Windows Development Environment

## Paso 1: Clonar el repositorio

```bash
git clone https://github.com/dzib/My-Dev-Environment.git
cd My-Dev-Environment
```

## Paso 2: Ejecutar el script de instalación

Abre **PowerShell como administrador** y ejecuta:

```powershell
.\powershell\scripts\setup_env.ps1
```

Este script automáticamente:
- ✅ Crea la carpeta `D:\Dev\Languages` si no existe
- ✅ Copia tu perfil de PowerShell
- ✅ Copia la configuración de VS Code

## Paso 3: Verificar la instalación

```powershell
# Recarga tu perfil
. $PROFILE

# Verifica que los alias funcionan
runr --version
```

## Requisitos

- Windows 11 o superior
- PowerShell 7+
- VS Code
- Git instalado

## Troubleshooting

### "El perfil de PowerShell no se cargó"
```powershell
# Verifica la ruta del perfil
$PROFILE

# Reinicia PowerShell
exit
```

### "Permiso denegado al ejecutar scripts"
```powershell
# Ejecuta con permisos elevados
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### "Ruta D:\Dev\Languages no encontrada"
```powershell
# Crea la carpeta manualmente
New-Item -ItemType Directory -Path "D:\Dev\Languages" -Force
```