#!/bin/bash

set -e

# Actualizar y preparar el entorno
sudo apt update
sudo apt install -y build-essential cmake libsqlite3-dev libtiff-dev libjpeg-dev libpng-dev libcurl4-openssl-dev
echo "Requerimientos intalados"