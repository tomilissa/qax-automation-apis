Feature: Probar el Registro de usuario, login y listar usuarios usando la API reqres.in

Background:
* url baseUrl
* def genEmail = function(usuario) { return usuario + karate.info.timestamp + '@reqres.in' }
* def emailOK = genEmail('usuario')


Scenario: CP01 Registro de Usuario
Given path '/register'
And header x-api-key = 'reqres-free-v1'
And request
          """
          {
            "email": "#(emailOK)",
            "password": "Password1234!"
          }
          """
When method post
Then status 200
And match response.id == '#number'
And match response.token == '#string'

* def userId = response.id
* def userToken = response.token

* print 'Nuevo userId:', userId
* print 'Nuevo userToken:', userToken


Scenario: CP02 Login de Usuario
    Given path '/login'
    And header x-api-key = 'reqres-free-v1'
    And request
          """
          {
            "email": "#(emailOK)",
            "password": "Password1234!"
          }
          """
    When method post
    Then status 200
    And match response.token == '#string'

Scenario: CP03 Listar usuarios
Given path '/users/ + userId'
And header x-api-key = 'reqres-free-v1'
When method get
Then status 200
And match response.data.id == userId
And match response.data[0].email == emailOK

    
