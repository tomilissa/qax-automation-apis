Feature: Gestión de Publicaciones en JSONPlaceholder

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')

  Scenario: Crear un nuevo post con datos fijos
    * def payload = read('classpath:data/post-data.json')
    Given path 'posts'
    And request payload
    When method post
    Then status 201
    And match response.title == payload.title

  Scenario: Crear un nuevo post con datos dinámicos
    # Genera el payload dinamico
    * def postData = call read('classpath:helpers/build-payload.feature')
    * print postData.payload
    # 4. Ejecutar POST
    Given path 'posts'
    And request postData.payload
    When method post
    Then status 201
    # 5. Validaciones
    And match response.title == postData.title
    And match response.body == postData.body
    And match response.userId == postData.userId