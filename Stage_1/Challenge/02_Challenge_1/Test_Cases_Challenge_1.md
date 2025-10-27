# Challenge 2

### 📁 Archivo
`Stage_1\Challenge\02_challenge_1`

🗒️
**Título de la entrega**: Testing Reqres API en Postman

**Historia de usuario**

Como tester de APIs,
Quiero poder listar usuarios, registrar nuevos usuarios y realizar login en el sistema de prueba,
Para asegurarme de que la API funcione correctamente y que los datos de usuario sean consistentes.

Additional data:

Base_url: https://reqres.in/api
Token: 
  - x-api-key: reqres-free-v1


**Criterios de aceptación**

1.  Listar usuarios:
    *   GET /users debe devolver HTTP 200.
    *   La lista de usuarios no debe estar vacía y cada usuario debe contener id, first_name, last_name y email.
2.  Registro de usuario:
    *   POST /register con payload válido devuelve HTTP 200.
    *   La respuesta debe incluir un id y un token.
3.  Login de usuario:
    *   POST /login con credenciales válidas devuelve HTTP 200.
    *   La respuesta debe contener un token para autenticación.

### ✅ Casos de Prueba

#### **Feature: Gestión de usuarios en la API Reqres**
  * Como tester de APIs
  * Quiero poder registrar nuevos usuarios, listar usuarios y realizar login en el sistema de prueba
  * Para asegurarme de que funcionan correctamente

#### **Scenario: CP01 - Registrar un nuevo usuario**
*   **Given:** la API está disponible en la Base_url
*   **When:** realizo una petición POST a "/posts" con el body:
      """
      {
        "title": "Mi primer post",
        "body": "Contenido de prueba Tomas",
        "userId": 1
      }
      """
*   **Then:** el código de respuesta debe ser 201
*   **And:** la respuesta debe contener un campo "id"
*   **And:** los campos "title", "body" y "userId" deben coincidir con lo enviado

#### **Scenario: CP02 - Listar todos los usuarios**
*   **Given:** la API está disponible en la Base_url
*   **When:** realizo una petición GET a "/users"
*   **Then:** el código de respuesta debe ser 200
*   **And:** la lista de usuarios no debe estar vacía
*   **And:** cada usuario debe contener los campos "id", "name", "username" y "email"

#### **Scenario: CP03 - Listar comentarios de un post**
*   **Given:** la API está disponible en la Base_url
*   **When:** realizo una petición GET a "/comments?postId=1"
*   **Then:** el código de respuesta debe ser 200
*   **And:** cada comentario debe contener los campos "id", "name", "email" y "body"



### 🚀 Ejecución (comandos o pasos):
1.  Descargar la colección de Postman `Api Testing - QAXPERT - TomiLissa.postman_collection.json`
2.  Abrir Postman e importar la colección del paso 1.
3.  Ejecutar los 3 request disponibles en la colección:
      - CP01 - Crear nuevo post
      - CP02 - Listar usuarios
      - CP03 - Listar comentarios de un post

### 🖼️ Evidencias: 
- Stage_1/Challenge/02_challenge_1/Evidences
