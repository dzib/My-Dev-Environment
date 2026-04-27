# My Windows Development Environment 🚀

Este repositorio contiene la configuración de mi entorno de trabajo en Windows 11, enfocado en productividad y desarrollo SQL.

## 🛠 Herramientas Utilizadas
- **Windhawk**: Personalización de interfaz (Efecto Mica/Acrylic).
- **PowerToys**: Gestión de ventanas (FancyZones) y buscador rápido.
- **TranslucentTB**: Barra de tareas minimalista.
- **SQL Server 2022 & SSMS**: Gestión de bases de datos.

## ⚡ Scripts de Utilidad
En la carpeta `/scripts` encontrarás archivos `.bat` para gestionar el servicio de SQL Server manualmente y ahorrar recursos:
- `sqlon.bat`: Inicia el servicio `MSSQLSERVER`.
- `sqloff.bat`: Detiene el servicio para reducir el consumo de CPU y ruido del ventilador.

## 🎨 Ajustes Visuales
He forzado el efecto Mica en aplicaciones basadas en Chromium (Chrome/Edge) usando el flag:
`--disable-features=RendererCodeIntegrity`
