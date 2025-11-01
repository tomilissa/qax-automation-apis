Feature: Validar la creación y listado de comentarios en la API JSONPlaceholder

  Background:
    * url baseUrl

  Scenario: CP01 Crear comentario
    Given path '/comments'
    And request 
      """
            {
            "postId": 1,
            "name": "Tomas",
            "email": "tomas@email.com",
            "body": "Este es un comentario de prueba Tomas"
            }

        """
    When method post
    Then status 201
    And match response == { id: '#notnull', postId: 1, name: 'Tomas', email: 'tomas@email.com', body: 'Este es un comentario de prueba Tomas' }

  Scenario: CP02 Listar comentarios de un post
    Given path '/comments'
    And param postId = 1
    When method get
    Then status 200
    And assert response.length > 0
    And match each response == { postId: '#notnull', id: '#notnull', name: '#notnull', email: '#@', body: '#notnull' }