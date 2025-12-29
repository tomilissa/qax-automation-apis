# 🥋 QAXpert — Ejecución de Pruebas API con Karate

Este proyecto usa **Karate Framework** para automatizar pruebas de API.  
Permite crear, consultar y actualizar datos (POST, GET, PUT) usando un **runner Java** y configuraciones de entorno dinámicas.

---
## 🚀 Comandos principales de ejecución

Flujo 1: parametrizado con utilizando "Scenario Outline" & sección "Examples":
- `mvn test -Dtest=ProductRunner`

Flujo 2: Flujo E2E:
- `mvn test -Dtest=E2EProductRunner`


## ✅ Casos de Prueba

### **Scenario: CP01 - Crear un nuevo producto**
*   **Given:** la API está disponible en https://api.restful-api.dev
*   **When:** realizo una petición POST para crear un nuevo producto a "/objects"
*   **Then:** el código de respuesta debe ser 200
*   **And:** la respuesta debe incluir id (único y numérico) y los datos en la respuesta deben coincidir exactamente con los datos enviados en el payload de la petición.

### **Scenario: CP02 - Consultar producto creado por ID**
*   **Given:** la API está disponible en https://api.restful-api.dev
*   **When:** realizo una petición GET para consultar el producto creado a "/objects?id={id}"
*   **Then:** el código de respuesta debe ser 200
*   **And:** la respuesta debe ser una lista de tamaño 1.
*   **And:** el primer objeto de la lista debe tener el id especificado y coincidir completamente con los datos originales del producto creado.

### **Scenario: CP03 - Reemplazar producto completo utilizando el método PUT**
*   **Given:** la API está disponible en https://api.restful-api.dev
*   **When:** realizo una petición PUT para actualizar completamente el producto "/objects/{id}"
*   **Then:** el código de respuesta debe ser 200
*   **And:** todos los campos en la respuesta deben coincidir con el nuevo payload enviado, reemplazando cualquier dato anterior.

### **Scenario: CP04 - Actualizar producto parcialmente utilizando el método PATCH**
*   **Given:** la API está disponible en https://api.restful-api.dev
*   **When:** realizo una petición PATCH para actualizar completamente el producto "/objects/{id}"
*   **Then:** el código de respuesta debe ser 200
*   **And:** la respuesta debe tener los campos especificados actualizados
*   **And:** el resto de los campos del producto deben permanecer con sus valores originales intactos.


## Evidences






