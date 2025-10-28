# Exercise 2

### 📁 Archivo
`Stage_1\Challenge\03_exercise_2`

🗒️
**Título de la entrega**: Primer test automatizado con Karate Lab - Gestión de Publicaciones y Comentarios

**Historia de usuario**

  * Como tester de APIs,
  * Quiero poder crear publicaciones (posts), listar usuarios y obtener comentarios asociados a un usuario
  * Para validar que la API funcione correctamente y que los datos sean consistentes.

Base_url: https://jsonplaceholder.typicode.com/

**Criterios de aceptación**

1.  Crear un post:
    *   POST /posts debe devolver HTTP 201.
    *   La respuesta debe contener id asignado y reflejar los datos enviados (title, body, userId).
2.  Listar usuarios:
    *   GET /users debe devolver HTTP 200.
    *   La lista no debe estar vacía y cada usuario debe tener id, name, username y email.
3.  Listar comentarios de un usuario:
    *   GET /comments?postId={id} debe devolver HTTP 200.
    *   Cada comentario debe contener id, name, email y body.

### ✅ Casos de Prueba

#### **Feature: Gestión de publicaciones y comentarios en la API JSONPlaceholder**
  * Como tester de APIs
  * Quiero validar los endpoints de posts, users y comments
  * Para asegurarme de que funcionan correctamente

#### **Scenario: CP01 - Crear un nuevo post exitosamente**
*   **Given:** la API está disponible en la Base_url
*   **When:** realizo una petición POST a "/posts" con el body:
      """
      {
        "title": "Mi primer post",
        "body": "Contenido de prueba Tomas con Karate",
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


### 🥋 Casos de Prueba en Karate:
-   Stage_1\Challenge\03_exercise_2\src\test\resources\JSONPlaceHolderAPI.feature


### 🚀 Ejecución (comandos o pasos):
1.  Clona o descarga el repositorio.
2.  Abre una nueva terminal en la carpeta raíz `qax-automation-apis`.
3.  Cambia al directorio del proyecto con el comando: cd Stage_1/Challenge/03_exercise_2
4.  Ejecuta el script con el comando:  mvn test -Dtest=karateRunner

### 🖼️ Evidencias: 
- Stage_1/Challenge/03_exercise_2/src/test/Evidences