Feature: Test de API JSON Placeholder utilizando Karate

   Scenario: CP01 - Crear un nuevo post exitosamente
    Given path '/posts'
    And request
          """
          {
            "title": "Mi primer post con Karate",
            "body": "Contenido de prueba Tomas con Karate",
            "userId": 1
          }
          """
    When method post
    Then status 201
    And match response.title == 'Mi primer post con Karate'
    And match response.body == 'Contenido de prueba Tomas con Karate'
    And match response.userId == 1
    And match response.id != null

  Scenario: CP02 - Listar todos los usuarios
    Given path '/users'
    When method get
    Then status 200
    And match each response contains { id: '#notnull', name: '#notnull', username: '#notnull', email: '#@' }


  Scenario: CP03 - Listar comentarios de un post
    Given path '/comments'
    And param postId = 1
    When method get
    Then status 200
    And match each response contains { id: '#notnull', name: '#notnull', email: '#string', body: '#notnull' }
