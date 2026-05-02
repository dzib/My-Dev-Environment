# My Windows Development Environment 🚀

Este repositorio contiene la configuración de mi entorno de trabajo en Windows 11, enfocado en productividad y desarrollo.

## 🛠 Herramientas Utilizadas
- **Windhawk**: Personalización de interfaz (Efecto Mica/Acrylic).
- **PowerToys**: Gestión de ventanas (FancyZones) y buscador rápido.
- **TranslucentTB**: Barra de tareas minimalista.
- **SQL Server 2022 & SSMS**: Gestión de bases de datos. *Edge Case

## ⚡ Scripts de Utilidad
n la carpeta `/scripts` encontrarás scripts para gestionar el servicio de SQL Server manualmente y ahorrar recursos:

### Batch (.bat)
- `OFF_SQL.bat`: Inicia el servicio `MSSQLSERVER`.
- `ON_SQL.bat`: Detiene el servicio para reducir el consumo de CPU y ruido del ventilador.

### PowerShell (.ps1)
- `SQLServiceMenu_v1.ps1` → Versión inicial del menú interactivo para controlar SQL Server.
- `SQLServiceMenu_v2.ps1` → Versión mejorada con resumen automático y opción rápida.

#### 🚀 Uso rápido
1. Abrir PowerShell como administrador.
2. Ejecutar el script:
   ```powershell
   .\SQLServiceMenu_v2.ps1

## 📝 Historial de versiones

### SQLServiceMenu.ps1
- **v1 (2026-05-01):** Menú básico con pausa manual.
- **v2 (2026-05-02):** Menú mejorado con resumen automático y opción rápida.


## 🎨 Ajustes Visuales
He forzado el efecto Mica en aplicaciones basadas en Chromium (Chrome/Edge) usando el flag:
`--disable-features=RendererCodeIntegrity`

## 📝 Conclusión y Aprendizajes Técnicos
Retos de Inyección: El caso de SSMS 22
- En este proyecto de personalización no solo aplique una transformación a la estética de mi entorno de trabajo, sino que sirvió como un ejercicio profundo de ingeniería inversa y depuración de sistema.

A través de la implementación de Windhawk, logré inyectar con éxito efectos de transparencia (Mica/Acrylic) en aplicaciones complejas como Chrome, Edge y Notion. El reto más significativo fue SSMS 22, donde exploré la modificación directa de código fuente en C++ y la manipulación del Registro de Windows para habilitar temas ocultos. Aunque SSMS presenta restricciones de renderizado por su arquitectura de subprocesos (DevHub.exe), el proceso documentado aquí demuestra la viabilidad de la inyección forzada y el manejo de prioridades en el Desktop Window Manager (DWM)

* Prueba de concepto:
![SSMS 22 con Backdrop forzado](./img/MicaForzado-SSMS22.png)
-- SSMS 22 con efecto Mica Alt (Forzado mediante inyección de Windhawk) --

*Nota: Mantego la configuración manual del registro para preservar el Dark Mode nativo de SSMS 22, garantizando un entorno de trabajo con menor fatiga visual sin depender de software de terceros.
