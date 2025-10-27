# Challenge

## Formato esperado de entrega
- 📁 Carpeta: `Stage_2/Challenge/tu-entrega-aqui`
- 🗒️ README.md por cada entrega con:
  - **Título de la entrega**
  - **Objetivo / Historia de usuario**
  - **Criterios de aceptación**
  - **Estrategia de prueba** (casos, datos, precondiciones)
  - **Ejecución** (comandos o pasos)
  - **Resultados** (evidencias, logs, capturas, reporte HTML/JSON)
- 🧪 Código/archivos de soporte en subcarpetas (`src`, `tests`, `resources`, etc.) según la tecnología.
- 🖼️ Evidencias en `evidencias/` cuando aplique.





# Challenge

## ¿Qué es?
Breve ejercicio de escenarios de complejidad media con criterios claros. Forma parte del **Stage_1** de la mentoría.

## Formato esperado de entrega

- 📁 Carpeta: `Stage_1\Challenge\02_challenge_1`

  - **Testing Apis en Postman**

  - **Test ReqRes API usando Postman**

  - **Historia de Usuario**
        Como tester de APIs,
        Quiero poder listar usuarios, registrar nuevos usuarios y realizar login en el sistema de prueba,
        Para asegurarme de que la API funcione correctamente y que los datos de usuario sean consistentes.

  - **Criterios de aceptación**
        Listar usuarios:

            GET /api/users debe devolver HTTP 200.
            La lista de usuarios no debe estar vacía y cada usuario debe contener id, first_name, last_name y email.

        Registro de usuario:

            POST /api/register con payload válido devuelve HTTP 200.
            La respuesta debe incluir un id y un token.
            
        Login de usuario:

            POST /api/login con credenciales válidas devuelve HTTP 200.
            La respuesta debe contener un token para autenticación.


- 📁 Carpeta: `Stage_1\Challenge\04_challenge_2`

  - **Mi prmera Automatizacion de Apis en Karate Labs**

  - **Automatizar la API de ReqRes utilizando Karate Labs**

  - **Historia de Usuario**
        Como tester de APIs,
        Quiero poder listar usuarios, registrar nuevos usuarios y realizar login en el sistema de prueba,
        Para asegurarme de que la API funcione correctamente y que los datos de usuario sean consistentes.

  - **Criterios de aceptación**

        Listar usuarios:

            GET /api/users debe devolver HTTP 200.
            La lista de usuarios no debe estar vacía y cada usuario debe contener id, first_name, last_name y email.

        Registro de usuario:

            POST /api/register con payload válido devuelve HTTP 200.
            La respuesta debe incluir un id y un token.
            
        Login de usuario:

            POST /api/login con credenciales válidas devuelve HTTP 200.
            La respuesta debe contener un token para autenticación.

  - **Ejecución**
            mvn test -Dtest=karateRunner

  - **Resultados**
            Evidences

