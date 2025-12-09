# EconomyApp-BuildApp

Este repositorio contiene todos los componentes necesarios (base de datos, API y frontend web) para levantar la aplicación de gestión financiera (**EconomyApp**) utilizando **Docker Compose**.

El objetivo es facilitar la descarga o clonación del proyecto y permitir que el usuario lo ejecute rápidamente con un solo comando.

## 🗂️ Estructura del Repositorio

| Directorio/Archivo       | Descripción |
|--------------------------|-------------|
| `economyapp-api`         | Contiene el archivo `.jar` de la API desarrollada en Java con Spring Boot. |
| `economyapp-db/dumps`    | Contiene el script de la base de datos necesario para la inicialización. |
| `economyapp-web`         | Contiene los archivos de la aplicación web desarrollada con Flutter. |
| `.env`                   | Archivo de configuración fundamental para definir variables de entorno (base de datos, puertos). **Requiere ajustes por parte del usuario.** |
| `docker-compose.yml`     | Define y orquesta los servicios de la aplicación (DB, API y Web). **Requiere pequeños ajustes.** |

## ✅ Requisitos Previos

Debes tener instalado:

- **Docker**
- **Docker Compose**

## ⚙️ Instalación y Configuración

Sigue estos pasos para levantar la aplicación en tu entorno local:

### 1. Clonar el Repositorio

```bash
git clone https://github.com/eltiosento/EconomyApp-BuildApp
cd EconomyApp-BuildApp
```

### 2. Configuración del Entorno (`.env`)

El archivo `.env` es crucial para definir la configuración de la base de datos y otros parámetros.

Abre `.env` y ajusta las variables según tus preferencias, asegurando que las credenciales sean correctas para permitir la comunicación entre la API y la base de datos.

### 3. Ajuste de IP Local (`economyapp-web/nginx.conf`)

Para que el servicio web funcione correctamente, debes especificar tu **dirección IP local** dentro de la configuración NGINX.

Modifica:

```
economyapp-web/nginx.conf
```

Cambia el marcador de posición por la IP local de tu máquina.  
Esto permitirá que el frontend acceda correctamente a la API.

### 4. Ajuste del Docker Compose (Opcional)

Revisa `docker-compose.yml` para realizar ajustes adicionales en puertos, volúmenes o configuraciones personalizadas si lo necesitas.

### 5. Iniciar la Aplicación

Una vez completados los ajustes, levanta toda la aplicación:

```bash
docker-compose up -d
```

Esto iniciará:

- La **base de datos**
- La **API**
- La **aplicación web**

## 🌐 Acceso

Cuando los contenedores estén activos:

- **API (Backend)**: *(Añadir aquí el puerto donde se expone la API)*  
- **Web (Frontend)**: Accede a la aplicación mediante la IP configurada en el paso 3.

## 📦 Código Fuente

Este repositorio es la versión de despliegue.  
Si deseas revisar o modificar el código fuente de los componentes individuales, aquí los tienes:

| Componente | Repositorio |
|-----------|-------------|
| **API (Java/Spring Boot)** | https://github.com/eltiosento/EconomyApp-Api |
| **Web (Flutter)** | https://github.com/eltiosento/EconomyApp-Web |
