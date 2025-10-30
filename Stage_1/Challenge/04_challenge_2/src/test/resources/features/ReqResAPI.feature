Feature: Probar el Registro de usuario, login y listar usuarios usando la API reqres.in

Background:
* url baseUrl
* header x-api-key = 'reqres-free-v1'



Scenario: CP01 Registro de Usuario
Given path '/register'
And request
          """
          {
            "email": "eve.holt@reqres.in",
            "password": "Password1234!"
          }
          """
When method post
Then status 200
And match response.id == '#number'
And match response.token == '#string'



Scenario: CP02 Login de Usuario
    Given path '/login'
    And request
          """
          {
            "email": "eve.holt@reqres.in",
            "password": "Password1234!"
          }
          """
    When method post
    Then status 200
    And match response.token == '#string'

Scenario: CP03 Listar usuarios

Given path '/users/4'
When method get
Then status 200
And match response.data.id == 4
And match response.data.email == "eve.holt@reqres.in"

    
