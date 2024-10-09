# Instalación de GDAL

1. Descarga el código fuente de [GDAL 3.9.2](https://gdal.org/en/latest/download.html#current-release).
2. Extrae el archivo y navega a la carpeta.
3. Configura el entorno de compilación y especifica las rutas a PROJ:

```bash
cd ~/ruta/del/gdal-3.9.2
mkdir build && cd build
cmake .. -DPROJ_INCLUDE_DIR=/usr/local/include -DPROJ_LIBRARY=/usr/local/lib/libproj.so -DPROJ_DATA=/usr/local/share/proj
make -j$(nproc)
sudo make install
```

Actualiza la caché de bibliotecas y verifica con:

```bash
sudo ldconfig
gdalinfo --version
```
