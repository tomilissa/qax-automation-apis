Feature: API Tests with Karate

Background:
  * url 'https://reqres.in/api'

   Scenario: CP01 Listar usuarios
    Given path '/api/users'

    When method get
    Then status 200
    And match response.id == 1
    And match response.email == 'george.bluth@reqres.in' 
    And match response.first_name == 'George'
    And match response.last_name == 'Bluth'

