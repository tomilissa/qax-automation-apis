# 🥋 Mi Proyecto Karate 

# Seccion 1 - JSONPlaceholder API

Esta primera sección del proyecto es un ejercicio práctico para aprender la **estructura básica de un proyecto en Karate** y cómo automatizar pruebas de APIs usando el endpoint público de [JSONPlaceholder](https://jsonplaceholder.typicode.com/).

---

## ⚙️ Requisitos

- [Java 11+](https://adoptium.net/) instalado
- [Maven](https://maven.apache.org/) instalado
- Editor de código recomendado: **VSCode** o **IntelliJ IDEA**


## 🚀 Ejecución

### 1. Clonar el repositorio

1.  Clona o descarga el repositorio <https://github.com/tomilissa/qax-automation-apis.git>
2.  Editar el archivo karate-config.js y configurar config.baseUrl = 'https://jsonplaceholder.typicode.com'; 
2.  Abre una nueva terminal en la carpeta raíz `qax-automation-apis`.
3.  Cambia al directorio del proyecto con el comando: cd Stage_2/Challenge/Challenge_1/auto_api_testing

### 2. Ejecutar pruebas con Maven
   
    mvn test -Dtest=CreatePostRunner
    mvn test -Dtest=CommentsRunner


### 3. Revisar reportes

    Al finalizar, Karate genera reportes en:
    
    target/karate-reports/karate-summary.html


### 🖼️ Evidencias: 
- Stage_2/Challenge/Challenge_1/auto_api_testing/src/test/Evidences/PostsAPI


## ✅ Casos de Prueba

### 🗒️ Feature 1 - Crear nuevo Post:

#### **Scenario: CP01 - Crear nuevo post utilizando datos fijos**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición POST para crear un nuevo post a "/posts" con el payload post-data:
      
          {
          "title": "Post desde archivo JSON",
          "body": "Contenido del post cargado desde post-data.json",
          "userId": 1
          }

*   **Then:** el código de respuesta debe ser 201
*   **And:** los datos deben coincidir con los enviados en el payload

#### **Scenario: CP02 - Crear nuevo post utilizando datos variables**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición POST para crear un nuevo post a "/posts" con un payload generado dinámicamente utilizando el build payload feature
*   **Then:** el código de respuesta debe ser 201
*   **And:** los datos deben coincidir con los enviados en el payload

### 🗒️ Feature 2 - Crear comentario y listar comentarios:

#### **Scenario: CP01 - Crear nuevo comentario**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición POST para crear un nuevo comment a "/comments" con el request:
        
            {
            "postId": 1,
            "name": "Tomas",
            "email": "tomas@email.com",
            "body": "Este es un comentario de prueba Tomas"
            }

*   **Then:** el código de respuesta debe ser 201
*   **And:** los datos deben coincidir con los enviados en el request


#### **Scenario: CP02 - Listar comentarios**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/comments" para obtener los comentarios asociados a un post especifico utilizando el postID.
*   **Then:** el código de respuesta debe ser 200
*   **And:** la respuesta no debe estar vacía
*   **And:** cada comentario debe contener los campos postId, id, name, email, body


# Seccion 2 - Book Store API

Esta segunda sección del proyecto trabajaremos con autenticación basada en tokens y aprenderemos a generar dinámicamente cuerpos de peticiones (JSON)

---

## ⚙️ Requisitos

- [Java 11+](https://adoptium.net/) instalado
- [Maven](https://maven.apache.org/) instalado
- Editor de código recomendado: **VSCode** o **IntelliJ IDEA**


## 🚀 Ejecución

### 1. Clonar el repositorio

1.  Clona o descarga el repositorio <https://github.com/tomilissa/qax-automation-apis.git>
2.  Editar el archivo karate-config.js y configurar config.baseUrl = 'https://demoqa.com' 
2.  Abre una nueva terminal en la carpeta raíz `qax-automation-apis`.
3.  Cambia al directorio del proyecto con el comando: cd Stage_2/Challenge/Challenge_1/auto_api_testing

### 2. Ejecutar pruebas con Maven

    mvn test -Dtest=UserRunner

### 3. Revisar reportes

    Al finalizar, Karate genera reportes en:

    target/karate-reports/features.bookStore.get-user.html

### 🖼️ Evidencias: 
- Stage_2/Challenge/Challenge_1/auto_api_testing/src/test/Evidences/BooksAPI


## ✅ Casos de Prueba

### 🗒️ Feature 1

#### **Scenario: CP01 - Crear usuario exitosamente**
*   **Given:** que el usuario desea crear un nuevo usuario
*   **When:** realizo una petición POST para crear un nuevo usuario a "/Account/v1/User" con los siguientes datos:
      
          {
          "userName": "2025ninjaForTesting103",
          "password": "Test@@12345"
          }

*   **Then:** el código de respuesta debe ser 201
*   **And:** la respuesta contiene una clave userId


#### **Scenario: CP02 - Generar token válido**
*   **Given:** que tengo credenciales correctas de un usuario ya creado
*   **When:** realizo una petición POST para crear un nuevo token a "/Account/v1/GenerateToken" con los siguientes datos:
      
          {
          "userName": "2025ninjaForTesting103",
          "password": "Test@@12345"
          }

*   **Then:** el código de respuesta debe ser 200
*   **And:** el token existe

#### **Scenario: CP03 - Obtener info del usuario con token válido**
*   **Given:** que tengo un token válido y un userId validos
*   **When:** realizo una petición GET para crear un nuevo token a "/Account/v1/User/{userId}" con header Authorization: Bearer
*   **Then:** el código de respuesta debe ser 200
*   **And:** LA respuesta contiene userID igual al {userId} consultado

#### **Scenario: CP04 - Crear usuario con datos inválidos - username vacío**

*   **Given:** que el usuario desea crear un nuevo usuario
*   **When:** realizo una petición POST para crear un nuevo usuario a "/Account/v1/User" con username vacío
*   **Then:** la API responde status_code == 400 y el cuerpo contiene información de error.

#### **Scenario: CP05 - Crear usuario con datos inválidos - password inválida**

*   **Given:** que el usuario desea crear un nuevo usuario
*   **When:** realizo una petición POST para crear un nuevo usuario a "/Account/v1/User" con password inválida
*   **Then:** la API responde status_code == 400 y el cuerpo contiene información de error.

#### **Scenario: CP06 - Generar token con credenciales inválidas**

*   **Given:** que tengo credenciales de un usuario ya creado
*   **When:** realizo una petición POST para crear un nuevo token a "/Account/v1/GenerateToken" con los credenciales inválidas
*   **Then:** la API responde status_code == 200 y mensaje de autenticación fallida: `User authorization failed.`

#### **Scenario: CP07 - Acceso protegido sin token**

*   **Given:** que tengo credenciales de un usuario ya creado
*   **When:** realizo la peticion POST para agregar el libro a un usuario a "/BookStore/v1/Books" sin token
*   **Then:** la API responde status_code == 401 y el cuerpo contiene mensaje de acceso denegado. `User not authorized!` y code `1200`

#### **Scenario: CP08 - Acceso protegido con token inválido**

*   **Given:** que tengo credenciales de un usuario ya creado
*   **When:** realizo la peticion POST para agregar el libro a un usuario a "/BookStore/v1/Books" con token inválido
*   **Then:** la API responde status_code == 401 y el cuerpo contiene mensaje de acceso denegado. `User not authorized!` y code `1200`

#### **Scenario: CP09 - Buscar libro y agregarlo a un usuario**

*   **Given:** realizo una petición GET al endpoint de `Books` para obtener la lista de libros, Extraer el primer ISBN del primer libro del array de resultados
*   **When:** Realiza la peticion POST para agregar el libro a un usuario a /BookStore/v1/Books
*   **Then:** la API responde status_code == 201 y verificar que la respuesta confirme que el libro fue agregado es correctamente.

