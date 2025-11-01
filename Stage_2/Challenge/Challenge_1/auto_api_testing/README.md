
# 🥋 Mi Proyecto Karate – JSONPlaceholder API

Este proyecto es un ejercicio práctico para aprender la **estructura básica de un proyecto en Karate** y cómo automatizar pruebas de APIs usando el endpoint público de [JSONPlaceholder](https://jsonplaceholder.typicode.com/).

---

## ⚙️ Requisitos

- [Java 11+](https://adoptium.net/) instalado
- [Maven](https://maven.apache.org/) instalado
- Editor de código recomendado: **VSCode** o **IntelliJ IDEA**


## 🚀 Ejecución

### 1. Clonar el repositorio

1.  Clona o descarga el repositorio <https://github.com/tomilissa/qax-automation-apis.git>
2.  Abre una nueva terminal en la carpeta raíz `qax-automation-apis`.
3.  Cambia al directorio del proyecto con el comando: cd Stage_2/Challenge/Challenge_1/auto_api_testing

### 2. Ejecutar pruebas con Maven
   
    mvn test -Dtest=CreatePostRunner

### 3. Revisar reportes

    Al finalizar, Karate genera reportes en:
    
    target/karate-reports/karate-summary.html


### 🖼️ Evidencias: 
- Stage_2/Challenge/Challenge_1/auto_api_testing/src/test/Evidences


## ✅ Casos de Prueba

### 🗒️ Feature - Crear nuevo Post:

#### **Scenario: CP01 - Crear nuevo post utilizando datos fijos**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición POST para crear un nuevo post a "/posts" con el payload post-data:
      
      """
      {
        "title": "Post desde archivo JSON",
        "body": "Contenido del post cargado desde post-data.json",
        "userId": 1
        }
      """
      
*   **Then:** el código de respuesta debe ser 201
*   **And:** los datos deben coincidir con los enviados en el payload

#### **Scenario: CP02 - Crear nuevo post utilizando datos variables**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición POST para crear un nuevo post a "/posts" con un payload generado dinámicamente utilizando el build payload feature
*   **Then:** el código de respuesta debe ser 201
*   **And:** los datos deben coincidir con los enviados en el payload

### 🗒️ Feature - Crear comentario y listar comentarios:

#### **Scenario: CP01 - Crear nuevo comentario**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición POST para crear un nuevo comment a "/comments" con el request:
        
        """
            {
            "postId": 1,
            "name": "Tomas",
            "email": "tomas@email.com",
            "body": "Este es un comentario de prueba Tomas"
            }
        """

*   **Then:** el código de respuesta debe ser 201
*   **And:** los datos deben coincidir con los enviados en el request


#### **Scenario: CP02 - Listar comentarios**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/comments" para obtener los comentarios asociados a un post especifico utilizando el postID:
*   **Then:** el código de respuesta debe ser 200
*   **And:** la respuesta no debe estar vacía
*   **And:** cada comentario debe contener los campos postId, id, name, email, body

