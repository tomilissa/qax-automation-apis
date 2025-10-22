Feature: API Tests with Karate reqres.in

Background:
  * url 'https://reqres.in/api'

   Scenario: CP01 Listar usuarios
    Given path '/users'
    Given header x-api-key = 'reqres-free-v1'
    When method get
    Then status 200
    And match response.data[0].id == 1
    And match response.data[0].email == 'george.bluth@reqres.in' 
    And match response.data[0].first_name == 'George'
    And match response.data[0].last_name == 'Bluth'
    And match response.data[1].id == 2
    And match response.data[1].email == 'janet.weaver@reqres.in' 
    And match response.data[1].first_name == 'Janet'
    And match response.data[1].last_name == 'Weaver'

