
# 🥋 Mini Proyecto Karate – JSONPlaceholder API

Este proyecto es un ejercicio práctico para aprender la **estructura básica de un proyecto en Karate** y cómo automatizar pruebas de APIs usando el endpoint público de [JSONPlaceholder](https://jsonplaceholder.typicode.com/).

---

## ⚙️ Requisitos

- [Java 11+](https://adoptium.net/) instalado
- [Maven](https://maven.apache.org/) instalado
- Editor de código recomendado: **VSCode** o **IntelliJ IDEA**

## ▶️ Ejecución

### 1. Clonar el repositorio

    git clone <url-del-repo>
    cd auto_api_testing

### 2. Ejecutar pruebas con Maven
   
    mvn test -Dtest=CreatePostRunner

### 3. Revisar reportes

    Al finalizar, Karate genera reportes en:
    
    target/karate-reports/karate-summary.html