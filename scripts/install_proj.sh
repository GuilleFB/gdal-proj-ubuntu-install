#!/bin/bash

set -e

# Variables de ruta
PROJ_VERSION="9.3.1"

# Instalar PROJ
echo "Instalando PROJ..."
cd ~
wget https://download.osgeo.org/proj/proj-${PROJ_VERSION}.tar.gz
tar xzf proj-${PROJ_VERSION}.tar.gz
cd proj-${PROJ_VERSION}
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
cd ~
echo "Instalación completada."