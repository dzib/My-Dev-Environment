# 🔧 Solución de Problemas

## PowerShell

### Problema: "El script no puede ejecutarse porque está deshabilitado"

**Solución:**

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Problema: El alias `runr` no funciona

**Solución:**

```powershell
# Edita tu perfil
code $PROFILE

# Verifica que la ruta existe
Test-Path "D:\Dev\Languages\R-4.6.1\bin\x64\R.exe"

# Recarga el perfil
. $PROFILE
```

## SQL Server

### Problema: SSMS no abre

**Solución:**

1. Reinicia el servicio MSSQLSERVER
2. Ejecuta: `.\powershell\scripts\SQLServiceMenu_v2.ps1`

### Problema: El servicio SQL Server está detenido

**Solución:**

```powershell
# Iniciar servicio
.\batch\scripts\OFF_SQL.bat

# Verificar estado
Get-Service MSSQLSERVER
```

## Git

### Problema: "Not a git repository"

**Solución:**

```bash
# Asegúrate de estar en la carpeta correcta
cd .\PROJECT\My-Dev-Environment

# Verifica
git status
```

### Problema: Merge conflicts

**Solución:**

1. Abre VS Code con el archivo conflictivo
2. Resuelve manualmente
3. `git add .` y `git commit -m "resolve: merge conflicts"`

## VS Code

### Problema: Terminal no detecta PowerShell

**Solución:**
Verifica en `.vscode/settings.json`:

```json
"terminal.integrated.defaultProfile.windows": "PowerShell"
```

## Más Ayuda

Consulta la documentación oficial:

- PowerShell: https://learn.microsoft.com/powershell/
- SQL Server: https://learn.microsoft.com/sql/
- VS Code: https://code.visualstudio.com/docs
