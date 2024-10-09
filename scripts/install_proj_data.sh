#!/bin/bash

set -e

# Variables de ruta
PROJ_DATA_VERSION="1.16"

# Configuración de proj-data
echo "Configurando proj-data..."
wget https://download.osgeo.org/proj/proj-data-${PROJ_DATA_VERSION}.tar.gz
tar xzf proj-data-${PROJ_DATA_VERSION}.tar.gz
sudo mkdir -p /usr/local/share/proj
sudo cp -r proj-data-${PROJ_DATA_VERSION}/* /usr/local/share/proj/

echo "Instalación completada."