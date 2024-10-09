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
  - [Licencia](#licencia)

### ¿Qué son GDAL y PROJ?

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

Para una instalación manual y detallada, consulta los documentos en la carpeta docs/.

## Verificación

Después de la instalación, utiliza los siguientes comandos para verificar que todo esté correctamente configurado:

```bash
proj
gdalinfo --version
```

### Uso

Estas bibliotecas permiten trabajar con datos geoespaciales, como transformaciones de coordenadas, proyecciones, y más.

## Licencia

Este proyecto se distribuye bajo la licencia MIT. Para más detalles, consulta el archivo LICENSE.
