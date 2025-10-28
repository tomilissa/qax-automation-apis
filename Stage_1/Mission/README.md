# Mission

### 📁 Archivo
- `Stage_1/Mission/05_Mission_SimpsonAPI`

🗒️ **Título de la entrega**: Automatización de APIs – The Simpsons

🗒️ **Historia de usuario**: Exponer listado y detalle de personajes de The Simpsons con paginación

  * Como consumidor externo de la API (aplicaciones cliente y servicios internos)
  * Quiero obtener un listado paginado de personajes y consultar el detalle por id
  * Para mostrar información consistente y navegable en mis aplicaciones y reutilizarla en otros servicios.


**Criterios de aceptación**

      - Obtener listado con status 200
      - Validar paginación por query param
      - Cálculo de metadatos
      - Estructura mínima de cada personaje en results.
      - Validación de formatos
      - Detalle por ID
      - Errores bien definidos
      - Orden estable del listado

### ✅ Casos de Prueba

#### **Scenario: CP01 - Listar personajes sin especificar pagina**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/characters" para obtener un listado de personajes
*   **Then:** el código de respuesta debe ser 200
*   **And:** la lista de personajes no debe estar vacía
*   **And:** la lista de personajes muestra la primera página de resultados
*   **And:** la respuesta incluye exactamente las claves count (int), next (string|null), prev (string|null), pages (int), results (array de objetos).

#### **Scenario: CP02 - Listar personajes por página**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/characters" indicando una página especifica en el query param (?page={2})
*   **Then:** el código de respuesta debe ser 200
*   **And:** la lista de personajes no debe estar vacía
*   **And:** next y prev son URLs absolutas correctas o null cuando no aplican.

#### **Scenario: CP03 - Listar personajes indicando una página inexistente**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/characters" indicando una página inválida en el query param (?page={250})
*   **Then:** el código de respuesta debe ser 400
*   **And:** el mensaje de error debe ser "Invalid page parameter"

#### **Scenario: CP04 - Listar personajes indicando una página inválida**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/characters" indicando una página inválida en el query param (?page={-1})
*   **Then:** el código de respuesta debe ser 400
*   **And:** el mensaje de error debe ser "Invalid page parameter"

#### **Scenario: CP05 - Listar personajes por ultima página**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/characters" indicando la última página en el query param (?page={60})
*   **Then:** el código de respuesta debe ser 200
*   **And:** la lista de personajes no debe estar vacía
*   **And:** next es null y prev es una URL absoluta correcta 

#### **Scenario: CP06 - Estructura minima de datos por personaje y validación de formatos **
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/characters" para obtener un listado de personajes
*   **Then:** el código de respuesta debe ser 200
*   **And:** cada personaje debe contener la siguiente información respetando los formatos indicados: 
            - id (int)
            - age (int)
            - birthdate (string YYYY-MM-DD)
            - gender (string)
            - name (string)
            - occupation (string)
            - portrait_path (string ruta /character/{id}.webp),
            - phrases (array)
            - status (string).

#### **Scenario: CP07 - Obtener info del personaje por ID**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/characters/1" para obtener la información de un personaje especifico
*   **Then:** el código de respuesta debe ser 200
*   **And:** la información debe ser correcta para el ID seleccionado

#### **Scenario: CP08 - Obtener info del personaje por ID invalido**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/characters/10000" para obtener la información de un personaje especifico
*   **Then:** el código de respuesta debe ser 404
*   **And:** el mensaje de error debe ser "Character not found"

#### **Scenario: CP09 - Verificar que el listado esta ordenado por ID**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición GET a "/characters" para obtener un listado de personajes
*   **Then:** el código de respuesta debe ser 200
*   **And:** los personajes están ordenados por ID asc



### 🥋 Casos de Prueba en Karate:
-   Stage_1/Mission/05_Mission_SimpsonAPI/src/test/resources/TheSimpsonAPI.feature
      
### 🚀 Ejecución (comandos o pasos):
1.  Clona o descarga el repositorio.
2.  Abre una nueva terminal en la carpeta raíz `qax-automation-apis`.
3.  Cambia al directorio del proyecto con el comando: cd Stage_1/Mission/05_Mission_SimpsonAPI
4.  Ejecuta el script con el comando:  mvn test -Dtest=karateRunner


### 🖼️ Evidencias: 
- Stage_1/Mission/05_Mission_SimpsonAPI/src/test/evidences

