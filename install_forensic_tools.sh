#!/bin/bash

# Definir colores para mensajes en la terminal
RED='\033[0;31m'   # Color rojo para errores o advertencias
GREEN='\033[0;32m' # Color verde para mensajes de éxito
YELLOW='\033[1;33m' # Color amarillo para mensajes de proceso o información
NC='\033[0m'       # Sin color, para resetear el color en la terminal

# Función para mostrar el menú de ayuda
show_help() {
    echo -e "${YELLOW}Ayuda del script de instalación de herramientas de forense digital:${NC}"
    echo -e "${GREEN}-d${NC} : Instala herramientas de adquisición de datos."
    echo -e "${GREEN}-r${NC} : Instala herramientas de análisis de red."
    echo -e "${GREEN}-s${NC} : Instala herramientas de análisis de sistemas."
    echo -e "${GREEN}-m${NC} : Instala Volatility y sus dependencias para el análisis de memoria."
    echo -e "${GREEN}-rd${NC} : Instala herramientas de análisis de disco y recuperación de datos."
    echo -e "${GREEN}-t <nombre_herramienta>${NC} : Instala una herramienta específica por nombre."
    echo -e "${GREEN}-h${NC} : Muestra este menú de ayuda."
}

# Función genérica para actualizar la lista de paquetes del sistema e instalar paquetes específicos
# $@ representa todos los argumentos pasados a la función, que en este caso son los nombres de los paquetes a instalar
update_and_install() {
    echo -e "${YELLOW}Actualizando lista de paquetes y realizando instalación...${NC}"
    sudo apt-get update  # Actualiza la lista de paquetes disponibles
    sudo apt-get install -y "$@"  # Instala los paquetes especificados sin pedir confirmación
}

# Función para instalar herramientas de adquisición de datos
install_data_acquisition() {
    echo -e "${YELLOW}Instalando herramientas de adquisición de datos...${NC}"
    update_and_install dc3dd guymager  # Instala dc3dd (una herramienta de clonación forense) y guymager (una herramienta de imagen forense)
}

# Función para instalar herramientas de análisis de disco y recuperación de datos
install_disk_analysis() {
    echo -e "${YELLOW}Instalando herramientas de análisis de disco y recuperación de datos...${NC}"
    update_and_install autopsy sleuthkit testdisk photorec scalpel  # Instala herramientas como Autopsy (análisis de discos), Sleuth Kit, TestDisk, PhotoRec y Scalpel
}

# Función para instalar herramientas de análisis de red
install_network_analysis() {
    echo -e "${YELLOW}Instalando herramientas de análisis de red...${NC}"
    update_and_install wireshark tcpdump nmap tshark  # Instala herramientas de análisis de tráfico de red como Wireshark, tcpdump, nmap y tshark
}

# Función para instalar herramientas de análisis de sistemas
install_system_analysis() {
    echo -e "${YELLOW}Instalando herramientas de análisis de sistemas...${NC}"
    update_and_install chkrootkit rkhunter lynis  # Instala herramientas para la detección de rootkits y auditoría de seguridad como chkrootkit, rkhunter y lynis
}

# Función para instalar Volatility, una herramienta para el análisis forense de memoria
install_memory_analysis() {
    echo -e "${YELLOW}Preparando la instalación de Volatility...${NC}"
    sudo apt update
    sudo apt-get install -y dwarfdump pcregrep libpcre2-dev  # Instala dependencias necesarias para Volatility
    sudo apt install -y python2.7  # Instala Python 2.7, necesario para Volatility
    sudo apt install -y build-essential python2.7-dev python2-dev  # Instala herramientas de compilación y desarrollo para Python 2.7

    # Descarga y ejecuta un script para instalar pip2, necesario para gestionar paquetes en Python 2.7
    wget https://gist.githubusercontent.com/anir0y/a20246e26dcb2ebf1b44a0e1d989f5d1/raw/a9908e5dd147f0b6eb71ec51f9845fafe7fb8a7f/pip2%2520install -O run.sh 
    chmod +x run.sh 
    ./run.sh

    echo -e "${YELLOW}Instalando Volatility...${NC}"
    pip2 install pycrypto distorm3  # Instala librerías necesarias para Volatility
    git clone https://github.com/volatilityfoundation/volatility.git  # Clona el repositorio de Volatility
    chmod +x volatility/vol.py  # Da permisos de ejecución al script principal de Volatility
    sudo mv volatility /opt  # Mueve Volatility a la carpeta /opt
    sudo ln -s /opt/volatility/vol.py /usr/bin/vol.py  # Crea enlaces simbólicos para ejecutar Volatility desde cualquier lugar
    sudo ln -s /opt/volatility/vol.py /usr/bin/volatility
    echo -e "${GREEN}Volatility instalado correctamente.${NC}"
}

# Función para instalar una herramienta específica por su nombre
# Recibe como argumento el nombre de la herramienta
install_specific_tool() {
    tool_name=$1
    echo -e "${YELLOW}Instalando $tool_name...${NC}"
    update_and_install "$tool_name"  # Llama a la función de instalación genérica con el nombre de la herramienta
}

# Procesar los argumentos de línea de comandos utilizando getopts
# Cada opción ejecuta una función correspondiente o muestra un mensaje de error si la opción no es válida
while getopts ":drsmrdt:h" opt; do
  case ${opt} in
    h )  # Opción para mostrar ayuda
      show_help
      exit 0
      ;;
    d )  # Opción para instalar herramientas de adquisición de datos
      install_data_acquisition
      ;;
    r )  # Opción para instalar herramientas de análisis de red
      install_network_analysis
      ;;
    s )  # Opción para instalar herramientas de análisis de sistemas
      install_system_analysis
      ;;
    m )  # Opción para instalar herramientas de análisis de memoria
      install_memory_analysis
      ;;
    rd )  # Opción para instalar herramientas de análisis de disco y recuperación de datos
      install_disk_analysis
      ;;
    t )  # Opción para instalar una herramienta específica, requiere un argumento
      install_specific_tool "$OPTARG"
      ;;
    \? )  # Manejo de opción inválida
      echo "Opción inválida: -$OPTARG" 1>&2
      show_help
      exit 1
      ;;
    : )  # Manejo de opciones que requieren un argumento, pero no lo reciben
      echo "Opción -$OPTARG requiere un argumento." 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Verifica si no se proporcionaron argumentos; si no, muestra un mensaje de advertencia
if [ $OPTIND -eq 1 ]; then 
    echo -e "${RED}No se proporcionaron argumentos. Use -h para obtener ayuda.${NC}"
fi
