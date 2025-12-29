# Mission Stage 2 - Proyecto de Automatización de APIs con Token – Go Rest API

En esta misión vamos a utilizar la Go Rest Api, una API pública que nos permite gestionar token, usuarios, commentarios y publicaciones.

  - **Objetivo / Historia de usuario**: Flujos de Prueba API Go Rest

  Como tester de APIs, 
  Quiero automatizar y validar la creación de usuarios, publicaciones y comentarios, 
  Para que pueda asegurarme de que la API funciona correctamente y cumple los contratos esperados.

  - 📁 Carpeta: `Stage_2/Mission/GO_REST_API`


  - **Criterios de aceptación**

      1. Crear usuario – Validar que se pueda crear un usuario con datos válidos.

      2. Crear publicación – Validar que un usuario pueda crear publicaciones asociadas a su cuenta.

      3. Crear comentario – Validar que un comentario se pueda agregar a una publicación existente.

  - **Casos de prueba**

  #### **Scenario: CP01 - Crear un usuario con datos válidos**
    *   **Given:** la API está disponible en la base_Url
    *   **When:** realizo una petición POST para crear un nuevo usuario a "/users" con un payload generado dinámicamente
    *   **Then:** el código de respuesta debe ser 201
    *   **And:** los datos deben coincidir con los enviados en el payload

  #### **Scenario: CP02 - Crear una nueva publicación asociada al usuario**
    *   **Given:** la API está disponible en la base_Url
    *   **When:** realizo una petición POST para crear una nueva publicación a "/posts" con un payload generado dinámicamente
    *   **Then:** el código de respuesta debe ser 201
    *   **And:** los datos deben coincidir con los enviados en el payload

  #### **Scenario: CP03 - Agregar un comentario a una publicación existente**
    *   **Given:** la API está disponible en la base_Url
    *   **When:** realizo una petición POST para crear una nueva publicación a "/comments" con un payload generado dinámicamente
    *   **Then:** el código de respuesta debe ser 201
    *   **And:** los datos deben coincidir con los enviados en el payload



  - **Requisitos**

      - [Java 11+](https://adoptium.net/) instalado
      - [Maven](https://maven.apache.org/) instalado
      - Editor de código recomendado: **VSCode** o **IntelliJ IDEA**

  - **🚀 Ejecución**

      1.  Clona o descarga el repositorio <https://github.com/tomilissa/qax-automation-apis.git>
      2.  Abre una nueva terminal en la carpeta raíz `qax-automation-apis`.
      3.  Cambia al directorio del proyecto con el comando: cd Stage_2/Mission/GO_REST_API
      4.  Ejecutar el comando: mvn test -Dtest=GeneralRunner



  - **Resultados** 
      ### 🖼️ Evidencias:
        Stage_2/Mission/GO_REST_API/src/test/Evidences



