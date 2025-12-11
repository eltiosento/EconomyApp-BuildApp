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

Puedes elegir los puertos por los que quieras que se sirva la base de datos, la Api y la web. También puedes cambiar el usuario encargado de poder manipular la base de datos y las contraseñas.
Se recomienda cambiar la llave `JWT_SECRET` con la que se firman los tokens.
Se ha dejado como predeterminado que los tokens tengan una duración de 1 día pero se si desea, también se puede cambian con `JWT_EXPIRATION` (milisegundos).

### 3. Ajuste de IP Local (`economyapp-web/nginx.conf`)

Para que el servicio web funcione correctamente, debes especificar tu **dirección IP local** dentro de la configuración NGINX.

Modifica:

```
economyapp-web/nginx.conf
```

Cambia el marcador de posición por la IP local de tu máquina con el puerto designado para la api.

```bash
location /api/ {
        # Ajusta la IP y el puerto según la configuración de tu API y tu red local
        proxy_pass http://<< tu ip >>:<< puerto de tu api >>/api/; <-- ejemplo: http://192.168.1.16:9090/api/;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        ...
    }
```

> [!WARNING]
> Asegurate que después de poner: *ip:puerto_api* tengas /api/ para completar la url como el ejemplo: http://192.168.1.16:9090/api/;

Esto permitirá que el frontend acceda correctamente a la API.

### 4. Ajuste del Docker Compose (Opcional)

Revisa `docker-compose.yml` para realizar ajustes adicionales en puertos, volúmenes o configuraciones personalizadas si lo necesitas.
Puede cambiar ajustes si su pc és relativamante lento o si desea instalar también un contenedor con phpMyAdmin, interfaç con la que poder acceder a la base de datos.
Simplemente ajuste el codigo del `docker-compose.yml` según su necessidad. 

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
Se podrá acceder a los distintos servicios mediante:
*Ejemplo a continuación si no se han cambiado los puertos.*
- **API (Backend)**: Desde http://localhost:9090 se accede a la documentación de la Api, mediante la plataforma Swagger.
- **Web (Frontend)**:  Accede a la aplicación mediante http://localhost:8080
- Para acceder a la aplicación web se ha dejado como predeterminado un usuario administrador con las credenciales:
    - Usuario: Admin
    - Contraseña: admin123
- Se recomienda una vez acceda a la aplicacnión, desde la sección *Perfil de usuario* cambiar los datos.

## 📦 Código Fuente

Este repositorio es la versión de despliegue.  
Si deseas revisar o modificar el código fuente de los componentes individuales, aquí los tienes:

| Componente | Repositorio |
|-----------|-------------|
| **API (Java/Spring Boot)** | https://github.com/eltiosento/EconomyApp-Api |
| **Web (Flutter)** | https://github.com/eltiosento/EconomyApp-Web |

---

## 👨‍💻 Autor

Proyecto desarrollado por **Vicent Roselló** como proyecto de final de ciclo de DAW. Aplicación educativa para la gestión económica familiar.

---

## 📄 Licencia

Uso personal y educativo.
