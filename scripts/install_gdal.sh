#!/bin/bash

set -e

# Variables de ruta
GDAL_VERSION="3.9.2"

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