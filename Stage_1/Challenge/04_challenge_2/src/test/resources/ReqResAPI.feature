Feature: Probar el Registro de usuario, login y listar usuarios usando la API reqres.in

Background:

* def genEmail = function(usuario) { return 'usuario' + karate.info.timestamp + '@reqres.in' }
* def emaiOK = genEmail('usuario1')
* print 'Email generado =', email

   Scenario: CP01 Listar usuarios
    Given path '/users'
    And header x-api-key = 'reqres-free-v1'
    When method get
    Then status 200
    And match response.data[0].id == 1
    And match response.data[0].email == 'george.bluth@reqres.in' 
    And match response.data[0].first_name == 'George'
    And match response.data[0].last_name == 'Bluth'

    Scenario: CP02 Registro de Usuario
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
    And match response.id == 4
    And match response.token == 'QpwL5tke4Pnpja7X4'


Scenario: CP03 Login de Usuario
    Given path '/login'
    And header x-api-key = 'reqres-free-v1'
    And request
          """
          {
            "email": "eve.holt@reqres.in",
            "password": "pistol"
          }
          """
    When method post
    Then status 200
    And match response.token == 'QpwL5tke4Pnpja7X4'
    
