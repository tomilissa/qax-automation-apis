# Challenge 2

### 📁 Archivo
`Stage_1\Challenge\04_challenge_2`

🗒️
**Título de la entrega**: Automatizar la API de ReqRes utilizando Karate Labs

**Historia de usuario**

  * Como tester de APIs,
  * Quiero poder listar usuarios, registrar nuevos usuarios y realizar login en el sistema de prueba,
  * Para asegurarme de que la API funcione correctamente y que los datos de usuario sean consistentes.

Additional data:

  - Base_url: https://reqres.in/api
 
  - Token => x-api-key: reqres-free-v1

**Criterios de aceptación**

1.  Registrar un nuevo usuario:
    *   POST /register con payload válido devuelve HTTP 200.
    *   La respuesta debe incluir un id y un token.
2.  Login de usuario:
    *   POST /login con credenciales válidas devuelve HTTP 200.
    *   La respuesta debe contener un token para autenticación.
3.  Listar usuarios:
    *   GET /users debe devolver HTTP 200.
    *   La lista de usuarios no debe estar vacía y cada usuario debe contener id, first_name, last_name y email.

### ✅ Casos de Prueba

#### **Feature: Gestión de usuarios en la API Reqres**
  * Como tester de APIs
  * Quiero poder registrar nuevos usuarios, listar usuarios y realizar login en el sistema de prueba
  * Para asegurarme de que funcionan correctamente

#### **Scenario: CP01 - Registrar un nuevo usuario**
*   **Given:** la API está disponible en la Base_url
*   **When:** realizo una petición POST para registrar un nuevo usuario a "/register" con el body:

        {
        "email": "eve.holt@reqres.in",
        "password": "Password1234!"
        }

*   **Then:** el código de respuesta debe ser 200
*   **And:** la respuesta debe incluir un id y un token.

#### **Scenario: CP02 - Login del usuario**
*   **Given:** la API está disponible en la Base_url
*   **When:** realizo una petición POST para loggear al usuario a "/login" con el body:

        {
        "email": "eve.holt@reqres.in",
        "password": "Password1234!"
        }

*   **Then:** el código de respuesta debe ser 200
*   **And:** la respuesta debe contener un token para autenticación.

#### **Scenario: CP03 - Listar usuarios**
*   **Given:** la API está disponible en la Base_url
*   **When:** realizo una petición GET a "/users" para obtener un listado de usuarios
*   **Then:** el código de respuesta debe ser 200
*   **And:** la lista de usuarios no debe estar vacía y cada usuario debe contener id, first_name, last_name y email


### 🥋 Casos de Prueba en Karate:
-   Stage_1/Challenge/04_challenge_2/src/test/resources/ReqResAPI.feature


### 🚀 Ejecución (comandos o pasos):
1.  Clona o descarga el repositorio.
2.  Abre una nueva terminal en la carpeta raíz `qax-automation-apis`.
3.  Cambia al directorio del proyecto con el comando: cd Stage_1/Challenge/04_challenge_2
4.  Ejecuta el script con el comando:  mvn test -Dtest=karateRunner

### 🖼️ Evidencias: 
- Stage_1/Challenge/04_challenge_2/src/test/Evidences