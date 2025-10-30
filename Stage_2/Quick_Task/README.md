# Quick Task

### 📁 Archivo
`Stage_2/Quick_Task/src/test/resources/features/email.feature`

### 🗒️ Objetivo
Crear una función en JavaScript que genere un email único y utilizarla desde un archivo .feature en Karate para enviar un POST a https://jsonplaceholder.typicode.com/users

### ✅ Casos de Prueba

#### **CP01 - Generar email unico**
*   **Given:** la API está disponible en la base_Url
*   **When:** realizo una petición POST al path /users para generar un mail único
*   **Then:** el código de respuesta debe ser 200
*   **And:** la respuesta debe incluir un id



### 🚀 Ejecución (comandos o pasos):
1.  Clona o descarga el repositorio.
2.  Abre una nueva terminal en la carpeta raíz `qax-automation-apis`.
3.  Cambia al directorio del proyecto con el comando: cd Stage_2/Quick_Task
4.  Ejecuta el script con el comando: mvn test -Dtest=karateRunner

### 🖼️ Evidencias: 
- `Stage_2/Quick_Task/src/test/Evidences`
