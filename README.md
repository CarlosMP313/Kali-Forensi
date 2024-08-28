# Instalador de Herramientas Forenses Digitales

Este script en Bash está diseñado para facilitar la instalación de un conjunto de herramientas forenses digitales en sistemas basados en Linux. Permite instalar diversas herramientas específicas para adquisición de datos, análisis de red, análisis de sistemas, análisis de memoria, y recuperación de datos, proporcionando una manera eficiente y centralizada para configurar un entorno de análisis forense digital.

## Índice

- [Requisitos](#requisitos)
- [Características](#características)
- [Instalación](#instalación)
- [Uso](#uso)
- [Opciones Disponibles](#opciones-disponibles)
- [Funcionamiento Interno](#funcionamiento-interno)
- [Contribuciones](#contribuciones)
- [Licencia](#licencia)

## Requisitos

- **Sistema Operativo:** Linux (Ubuntu o distribuciones basadas en Debian son recomendadas).
- **Permisos:** Debes tener permisos de administrador (sudo) para instalar paquetes.
- **Conexión a Internet:** Necesaria para descargar e instalar las herramientas.

## Características

- **Instalación Automatizada:** Instala diversas herramientas forenses digitales automáticamente con comandos simples.
- **Modularidad:** Puedes elegir instalar solo las herramientas necesarias para tu caso de uso específico.
- **Soporte para Volatility:** Incluye un proceso detallado para instalar Volatility, una herramienta popular para el análisis forense de memoria.
- **Colores en Terminal:** Los mensajes del script están coloreados para facilitar la lectura y comprensión de las operaciones en curso.

## Instalación

1. **Clonar el repositorio:**

   ```bash
   git clone https://github.com/CarlosMP313/Kali-Forensi.git
   cd Kali-Forensi
