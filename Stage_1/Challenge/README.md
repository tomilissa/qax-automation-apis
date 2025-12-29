# Stage 1 - Challenge 1 & 2


### 📁 Carpeta:  `Stage_1/Challenge`

🗒️
**Título de la entrega**: Verificar el funcionamiento de la API de Gestion de Usuarios ReqRes en Postman y Karate

**Objetivo**: En este primer reto el objetivo es practicar la automatización y prueba de APIs usando la plataforma [ReqRes](https://reqres.in/), una API pública para pruebas de usuarios y autenticación.


***Challenge 1***: Verificar el funcionamiento de la API de Gestion de Usuarios ReqRes en Postman (Stage_1/Challenge/Challenge 1 - Postman)

***Challenge 2***: Verificar el funcionamiento de la API de Gestion de Usuarios ReqRes en Karate (Stage_1/Challenge/Challenge 2 - Karate)


**Historia de Usuario: Gestión de usuarios en la API Reqres**
  * Como tester de APIs
  * Quiero poder registrar nuevos usuarios, listar usuarios y realizar login en el sistema de prueba
  * Para asegurarme de que funcionan correctamente



### ✅ Casos de Prueba - Challenge 1 & 2

#### **Scenario: CP01 - Registrar un nuevo usuario**
*   **Given:** la API está disponible en https://reqres.in/
*   **When:** realizo una petición POST para registrar un nuevo usuario a "/register" con el body:

        {
        "email": "eve.holt@reqres.in",
        "password": "anypassword"
        }

*   **Then:** el código de respuesta debe ser 200
*   **And:** la respuesta debe incluir un id y un token.

#### **Scenario: CP02 - Login del usuario**
*   **Given:** la API está disponible en https://reqres.in/
*   **When:** realizo una petición POST para loggear al usuario a "/login" con el body:

        {
        "email": "eve.holt@reqres.in",
        "password": "anypassword"
        }

*   **Then:** el código de respuesta debe ser 200
*   **And:** la respuesta debe contener un token para autenticación.

#### **Scenario: CP03 - Listar usuarios**
*   **Given:** la API está disponible en https://reqres.in/
*   **When:** realizo una petición GET a "/users" para obtener un listado de usuarios
*   **Then:** el código de respuesta debe ser 200
*   **And:** la lista de usuarios no debe estar vacía y cada usuario debe contener id, first_name, last_name y email


### 🚀 Ejecución (comandos o pasos):

- Challenge 1: API de Gestion de Usuarios ReqRes en Postman

1.  Descargar la colección de Postman `ReqRes TomiLissa.postman_collection.json`
2.  Abrir Postman e importar la colección del paso 1.
3.  Ejecutar los 3 request disponibles en la colección:
      - CP01 - Registrar un nuevo usuario
      - CP02 - Login del usuario
      - CP03 - Listar usuarios

- Challenge 2: API de Gestion de Usuarios ReqRes en Karate

1.  Clona o descarga el repositorio.
2.  Abre una nueva terminal en la carpeta raíz `qax-automation-apis`.
3.  Cambia al directorio del proyecto con el comando: cd Stage_1/Challenge/KarateProject_Challenge1_ReqRes
4.  Ejecuta el script con el comando:  mvn test -Dtest=karateRunner


### 🧪 Código/archivos de soporte de Karate (Challenge 2)

- Challenge/KarateProject_Challenge1_ReqRes/src

### 🖼️ Evidencias de Karate (Challenge 2)

- Challenge/KarateProject_Challenge1_ReqRes/karate-reports



