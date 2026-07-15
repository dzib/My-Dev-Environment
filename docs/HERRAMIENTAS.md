# 🛠 Herramientas del Entorno

## Instalación de Herramientas

### Opción 1: Instalación Manual

#### Sistema & Personalización
1. **Windhawk** - https://windhawk.net
2. **PowerToys** - https://github.com/microsoft/PowerToys
3. **TranslucentTB** - https://www.microsoft.com/store/apps/9PF4KZ2VN4W6
4. **PC Manager** - https://www.microsoft.com/store/apps/9PM860BH5P5S

#### Desarrollo
1. **VS Code** - https://code.visualstudio.com
2. **PowerShell 7** - https://github.com/PowerShell/PowerShell
3. **SQL Server 2022** - Descarga de Microsoft
4. **SSMS 22** - https://learn.microsoft.com/sql/ssms/

#### Lenguajes
1. **Python 3.14** - https://www.python.org
2. **R 4.6.1** - https://www.r-project.org
3. **Git** - https://git-scm.com

### Opción 2: Instalación con Chocolatey

```powershell
# Instalar Chocolatey (si no lo tienes)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Instalar herramientas
choco install powershell-core python r git vscode -y
```

## Versiones Actuales

| Herramienta | Versión |
|------------|----------|
| PowerShell | 7.6.3 |
| Python | 3.14 |
| R | 4.6.1 |
| VS Code | Latest |
| SQL Server | 2022 |
| SSMS | 22 |

## Extensiones de VS Code Recomendadas

```json
{
  "extensions": [
    "ms-vscode.powershell",
    "ms-vscode.cpptools",
    "charliermarsh.ruff",
    "ms-python.python",
    "ms-mssql.mssql"
  ]
}
```

Para instalar todas: `code --install-extension [extension-id]`