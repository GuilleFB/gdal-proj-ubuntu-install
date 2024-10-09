#!/bin/bash

set -e

# Actualizar y preparar el entorno
sudo apt update
sudo apt install -y build-essential cmake libsqlite3-dev libtiff-dev libjpeg-dev libpng-dev libcurl4-openssl-dev

# Variables de ruta
PROJ_VERSION="9.3.1"
GDAL_VERSION="3.9.2"
PROJ_DATA_VERSION="1.16"

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

# Configuración de proj-data
echo "Configurando proj-data..."
wget https://download.osgeo.org/proj/proj-data-${PROJ_DATA_VERSION}.tar.gz
tar xzf proj-data-${PROJ_DATA_VERSION}.tar.gz
sudo mkdir -p /usr/local/share/proj
sudo cp -r proj-data-${PROJ_DATA_VERSION}/* /usr/local/share/proj/

# Instalar GDAL
echo "Instalando GDAL..."
wget https://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz
tar xzf gdal-${GDAL_VERSION}.tar.gz
cd gdal-${GDAL_VERSION}
mkdir build && cd build
cmake .. -DPROJ_INCLUDE_DIR=/usr/local/include -DPROJ_LIBRARY=/usr/local/lib/libproj.so -DPROJ_DATA=/usr/local/share/proj
make -j$(nproc)
sudo make install

# Actualizar caché de bibliotecas compartidas
sudo ldconfig

echo "Instalación completada. Verifica con 'proj' y 'gdalinfo --version'"