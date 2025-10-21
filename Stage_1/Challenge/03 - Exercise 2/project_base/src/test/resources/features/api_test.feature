Feature: API Tests with Karate

Background:
  * url 'https://jsonplaceholder.typicode.com'

   Scenario: CP01 Crear nuevo post
    Given path '/posts'
    And request
          """
          {
            "title": "Mi primer post",
            "body": "Contenido de prueba",
            "userId": 1
          }
          """
    When method post
    Then status 201
    And match response.title == 'Mi primer post'
    And match response.body == 'Contenido de prueba'
    And match response.userId == 1
    And match response.id != null

