# Guía de Instalación de GDAL, PROJ y proj-data en Ubuntu 24.04

Este repositorio contiene instrucciones detalladas y scripts para compilar e instalar las bibliotecas **GDAL**, **PROJ**, y **proj-data** desde el código fuente en Ubuntu 24.04. Este proceso asegura una instalación personalizada y completa, ideal para entornos que requieren configuraciones específicas.

## Contenidos

- [Guía de Instalación de GDAL, PROJ y proj-data en Ubuntu 24.04](#guía-de-instalación-de-gdal-proj-y-proj-data-en-ubuntu-2404)
  - [Contenidos](#contenidos)
  - [¿Qué son GDAL y PROJ?](#qué-son-gdal-y-proj)
  - [Requisitos](#requisitos)
  - [Instalación](#instalación)
  - [Verificación](#verificación)
  - [Uso](#uso)
  - [Errores posibles](#errores-posibles)
    - [1. Error de Dependencias No Satisfechas](#1-error-de-dependencias-no-satisfechas)
    - [2. Error al Ejecutar PROJ](#2-error-al-ejecutar-proj)
    - [3. GDAL no Detecta PROJ](#3-gdal-no-detecta-proj)
    - [4. Error de Vinculación Dinámica](#4-error-de-vinculación-dinámica)
    - [5. Error al Cargar Datos de PROJ](#5-error-al-cargar-datos-de-proj)
    - [6. Error en la Versión de PROJ](#6-error-en-la-versión-de-proj)
    - [7. Error de Compilación en CMake](#7-error-de-compilación-en-cmake)
    - [8. Error de Instalación de GDAL](#8-error-de-instalación-de-gdal)
    - [9. Error al Verificar la Versión de GDAL](#9-error-al-verificar-la-versión-de-gdal)
  - [Licencia](#licencia)

## ¿Qué son GDAL y PROJ?

**GDAL (Geospatial Data Abstraction Library)** es una biblioteca de código abierto para el procesamiento y manipulación de datos geoespaciales. Es ampliamente utilizada para leer y escribir una variedad de formatos de datos espaciales, desde imágenes satelitales y mapas rasterizados hasta formatos vectoriales como shapefiles y GeoJSON. GDAL proporciona herramientas esenciales para analizar, transformar, y manipular datos geográficos, haciéndolo fundamental en aplicaciones de cartografía, SIG (Sistema de Información Geográfica), y análisis espacial.

**PROJ** es una biblioteca de transformación de coordenadas que facilita la conversión entre diferentes sistemas de proyección y referencia. Es crucial para trabajos geoespaciales que requieren precisión en la transformación de datos entre coordenadas geográficas (como latitud y longitud) y coordenadas proyectadas (como UTM). Además, PROJ maneja datos geodésicos que definen cómo mapear la superficie curva de la Tierra en representaciones planas.

Al usar **GDAL** junto con **PROJ**, puedes trabajar con datos geoespaciales de manera integral: importar, transformar, y exportar datos geográficos con facilidad y precisión. Esta guía te ayudará a instalar ambas bibliotecas desde el código fuente en Ubuntu 24.04, asegurando que dispongas de una configuración optimizada para tus necesidades específicas de procesamiento de datos geoespaciales.

## Requisitos

Asegúrate de tener permisos de administrador y de que tu sistema esté actualizado. Para compilar estas bibliotecas, se requieren algunas dependencias básicas.

## Instalación

Ejecuta el script de instalación principal para compilar e instalar todas las bibliotecas:

```bash
./scripts/install_all.sh
```

Para una instalación manual y detallada, consulta los documentos en la carpeta [docs/](docs/).

## Verificación

Después de la instalación, utiliza los siguientes comandos para verificar que todo esté correctamente configurado:

```bash
proj
gdalinfo --version
```

## Uso

Estas bibliotecas permiten trabajar con datos geoespaciales, como transformaciones de coordenadas, proyecciones, y más.

## Errores posibles

Aquí tienes una lista de posibles errores que podrías encontrar si algo falla durante la instalación o configuración de GDAL, PROJ y proj-data, junto con algunas sugerencias para solucionarlos:

### 1. Error de Dependencias No Satisfechas

- **Mensaje**: `error: No se pudo encontrar la dependencia <nombre_de_dependencia>`
- **Causa**: No se han instalado todas las dependencias necesarias para compilar.
- **Solución**: Asegúrate de haber ejecutado el comando de instalación de dependencias:

     ```bash
     sudo apt install build-essential cmake libsqlite3-dev libtiff-dev libjpeg-dev libpng-dev libcurl4-openssl-dev
     ```

### 2. Error al Ejecutar PROJ

- **Mensaje**: `proj: command not found`
- **Causa**: PROJ no se instaló correctamente o el binario no está en el `PATH`.
- **Solución**: Verifica la instalación de PROJ, y si es necesario, añade `/usr/local/bin` al `PATH`:

     ```bash
     export PATH=/usr/local/bin:$PATH
     ```

### 3. GDAL no Detecta PROJ

- **Mensaje**: `error: PROJ not found`
- **Causa**: GDAL no pudo encontrar la biblioteca PROJ debido a rutas incorrectas durante la compilación.
- **Solución**: Asegúrate de especificar correctamente las rutas en el comando `cmake` de GDAL:

     ```bash
     cmake .. -DPROJ_INCLUDE_DIR=/usr/local/include -DPROJ_LIBRARY=/usr/local/lib/libproj.so -DPROJ_DATA=/usr/local/share/proj
     ```

### 4. Error de Vinculación Dinámica

- **Mensaje**: `error while loading shared libraries: libproj.so: cannot open shared object file: No such file or directory`
- **Causa**: El sistema no encuentra las bibliotecas dinámicas de PROJ.
- **Solución**: Ejecuta `sudo ldconfig` para actualizar la caché de bibliotecas compartidas, o agrega el directorio de bibliotecas a la variable `LD_LIBRARY_PATH`:

     ```bash
     export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
     ```

### 5. Error al Cargar Datos de PROJ

- **Mensaje**: `proj_create: Cannot find proj.db`
- **Causa**: Los datos de `proj-data` no están en la ubicación esperada.
- **Solución**: Asegúrate de que `proj-data` esté en `/usr/local/share/proj` o en la ruta especificada en `PROJ_DATA`:

     ```bash
     export PROJ_DATA=/usr/local/share/proj
     ```

### 6. Error en la Versión de PROJ

- **Mensaje**: `GDAL was built against PROJ 9.3 but runtime has PROJ 9.1`
- **Causa**: Mismatch entre las versiones de PROJ utilizadas en el momento de la compilación y en el momento de ejecución.
- **Solución**: Asegúrate de tener instalada y configurada la misma versión de PROJ durante la compilación y ejecución de GDAL.
- **Mensaje**: `OSError: /lib/x86_64-linux-gnu/libgdal.so.34: undefined symbol: proj_crs_has_point_motion_operation`
- **Causa**: Este error se debe a un desajuste entre las versiones de GDAL y PROJ, donde la versión de PROJ no tiene el símbolo que GDAL está tratando de usar.
- **Solución**:

  1. Actualiza PROJ: Asegúrate de estar utilizando una versión de PROJ compatible con GDAL. Las versiones más recientes de GDAL suelen ser compatibles con versiones recientes de PROJ, así que revisa la documentación de GDAL para confirmar las versiones compatibles.
  2. Compila nuevamente GDAL: Si actualizas PROJ, deberías recompilar GDAL para asegurarte de que se vincule correctamente a la nueva versión de PROJ.
  3. Verifica las versiones y rutas: Asegúrate de que el GDAL que estás utilizando se haya compilado contra la versión correcta de PROJ, especialmente si tienes varias versiones de estas bibliotecas instaladas.

### 7. Error de Compilación en CMake

- **Mensaje**: `CMake Error at CMakeLists.txt:### (find_package): By not providing "FindPROJ.cmake" in CMAKE_MODULE_PATH`
- **Causa**: CMake no puede encontrar el archivo de configuración de PROJ.
- **Solución**: Especifica explícitamente la ruta de instalación de PROJ en el comando `cmake` de GDAL y asegúrate de que CMake pueda localizar el archivo `FindPROJ.cmake`.

### 8. Error de Instalación de GDAL

- **Mensaje**: `error: ‘nullptr’ was not declared in this scope` o `fatal error: cannot find -lproj`
- **Causa**: Faltan archivos de encabezado o bibliotecas necesarias para compilar GDAL.
- **Solución**: Confirma que todas las rutas de PROJ están correctamente especificadas y que todas las dependencias están instaladas.

### 9. Error al Verificar la Versión de GDAL

- **Mensaje**: `gdalinfo: error while loading shared libraries`
- **Causa**: Problemas de vinculación dinámica o ruta incorrecta de bibliotecas.
- **Solución**: Ejecuta `sudo ldconfig` para actualizar la caché de bibliotecas compartidas y verifica nuevamente.

Estos son algunos errores comunes y sus soluciones, lo que debería ayudarte a identificar y resolver problemas si algo falla durante la instalación.

## Licencia

Este proyecto se distribuye bajo la licencia MIT. Para más detalles, consulta el archivo LICENSE.
