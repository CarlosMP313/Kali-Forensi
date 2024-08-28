#Instalador de Herramientas Forenses Digitales
Este script en Bash está diseñado para facilitar la instalación de un conjunto de herramientas forenses digitales en sistemas basados en Linux. Permite instalar diversas herramientas específicas para adquisición de datos, análisis de red, análisis de sistemas, análisis de memoria, y recuperación de datos, proporcionando una manera eficiente y centralizada para configurar un entorno de análisis forense digital.
Índice
•	Requisitos
•	Características
•	Instalación
•	Uso
•	Opciones Disponibles
•	Funcionamiento Interno
•	Contribuciones
•	Licencia
Requisitos
•	Sistema Operativo: Linux (Ubuntu o distribuciones basadas en Debian son recomendadas).
•	Permisos: Debes tener permisos de administrador (sudo) para instalar paquetes.
•	Conexión a Internet: Necesaria para descargar e instalar las herramientas.
Características
•	Instalación Automatizada: Instala diversas herramientas forenses digitales automáticamente con comandos simples.
•	Modularidad: Puedes elegir instalar solo las herramientas necesarias para tu caso de uso específico.
•	Soporte para Volatility: Incluye un proceso detallado para instalar Volatility, una herramienta popular para el análisis forense de memoria.
•	Colores en Terminal: Los mensajes del script están coloreados para facilitar la lectura y comprensión de las operaciones en curso.
Instalación
1.	Clonar el repositorio:
bash
Copiar código
git clone https://github.com/CarlosMP313/Kali-Forensi.git
cd Kali-Forensi
2.	Dar permisos de ejecución al script:
bash
Copiar código
chmod +x install_forensic_tools.sh
3.	Ejecutar el script:
Puedes ejecutar el script con diferentes opciones para instalar las herramientas que necesites (ver la sección Uso).
Uso
Ejecuta el script desde la terminal usando el siguiente comando:
bash
Copiar código
./install_forensic_tools.sh [opciones]
Si necesitas ayuda o quieres ver las opciones disponibles, puedes usar:
bash
Copiar código
./install_forensic_tools.sh -h
Opciones Disponibles
El script soporta varias opciones para instalar diferentes categorías de herramientas forenses:
•	-d : Instala herramientas de adquisición de datos.
•	-r : Instala herramientas de análisis de red.
•	-s : Instala herramientas de análisis de sistemas.
•	-m : Instala Volatility y sus dependencias para el análisis de memoria.
•	-rd : Instala herramientas de análisis de disco y recuperación de datos.
•	-t <nombre_herramienta> : Instala una herramienta específica por nombre.
•	-h : Muestra el menú de ayuda con todas las opciones.
Ejemplos de Uso
•	Instalar herramientas de adquisición de datos:
bash
Copiar código
./install_forensic_tools.sh -d
•	Instalar Volatility para análisis de memoria:
bash
Copiar código
./install_forensic_tools.sh -m
•	Instalar una herramienta específica, por ejemplo, nmap:
bash
Copiar código
./install_forensic_tools.sh -t nmap
Funcionamiento Interno
El script funciona a través de una serie de funciones modulares, cada una diseñada para instalar un conjunto específico de herramientas:
1.	Definición de Colores: Se definen variables para colorear los mensajes en la terminal, facilitando la visualización de mensajes importantes.
2.	Función show_help: Muestra el menú de ayuda con todas las opciones y su descripción.
3.	Función update_and_install: Es la función principal que se encarga de actualizar la lista de paquetes del sistema e instalar los paquetes indicados. Se utiliza en todas las funciones de instalación.
4.	Funciones de Instalación por Categoría:
o	install_data_acquisition: Instala herramientas como dc3dd y guymager para la adquisición de datos.
o	install_disk_analysis: Instala herramientas para el análisis de disco y recuperación de datos, como autopsy y testdisk.
o	install_network_analysis: Instala herramientas de análisis de red como wireshark y tcpdump.
o	install_system_analysis: Instala herramientas de análisis de sistemas, como chkrootkit y lynis.
o	install_memory_analysis: Realiza la instalación de Volatility, incluyendo todas sus dependencias necesarias.
5.	Función install_specific_tool: Permite instalar cualquier herramienta específica por su nombre.
6.	Manejo de Argumentos con getopts: El script utiliza getopts para procesar los argumentos de línea de comandos, permitiendo al usuario seleccionar las opciones de instalación de manera flexible.
Contribuciones
¡Contribuciones son bienvenidas! Si deseas mejorar este script, sigue estos pasos:
1.	Haz un fork del repositorio.
2.	Crea una nueva rama (git checkout -b feature/nueva-funcionalidad).
3.	Realiza tus cambios y realiza un commit (git commit -am 'Añadir nueva funcionalidad').
4.	Sube tus cambios a tu rama (git push origin feature/nueva-funcionalidad).
5.	Abre un Pull Request.
Licencia
Este proyecto está licenciado bajo la Licencia MIT. Para más detalles, consulta el archivo LICENSE.
