# Instalación de PROJ

1. Descarga [PROJ 9.3.1](https://proj.org/en/9.3/download.html#current-release).
2. Extrae el archivo y navega a la carpeta.
3. Compila e instala PROJ:

```bash
cd ~/ruta/del/proj-9.3.1
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
```

Verifica la instalación con:

```bash
proj
```
