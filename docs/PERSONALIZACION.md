# 🎨 Guía de Personalizaciones

## Windhawk - Mica/Acrylic en Aplicaciones

### Activar en Chrome/Edge

1. Abre Windhawk
2. Busca: "Mica for Everyone"
3. Aplica el mod
4. Agrega flag a Chrome/Edge:
   ```
   --disable-features=RendererCodeIntegrity
   ```

### SSMS 22 con Mica Forzado

1. Instala el mod "Mica Alt" en Windhawk
2. Modifica Registro de Windows:
   ```
   HKEY_CURRENT_USER\Software\Microsoft\SQL Server Management Studio\22.0\
   ```
3. Añade clave: `UseOSTheme` = 1

**Nota:** El tema oscuro se preserva de forma nativa.

## PowerShell Personalizado

Edita `powershell/Microsoft.PowerShell_profile.ps1`:

```powershell
# Agregar nuevo alias
Set-Alias mynewcmd "C:\Path\To\Command.exe"

# Agregar función personalizada
function MyFunction {
    Write-Host "Hola desde mi función" -ForegroundColor Green
}
```

Recarga con: `. $PROFILE`

## VS Code

Edita `.vscode/settings.json` para cambiar:

- **Fuente:** `"editor.fontFamily"`
- **Tamaño:** `"editor.fontSize"`
- **Terminal por defecto:** `"terminal.integrated.defaultProfile.windows"`

## TranslucentTB

1. Abre la aplicación
2. Selecciona: "Mica" o "Acrylic"
3. Ajusta transparencia a tu gusto
4. Habilita en panel derecho

---

**Próxima actualización:** v1.2.1 con más personalizaciones.
