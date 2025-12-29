Feature: Crear usuario exitosamente

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')
    * def userData = callonce read('classpath:features/helpers/build-payload-user.feature')
    * def payload = userData.payload

@create
  Scenario: CP01 - Crear usuario exitosamente
    Given path '/users'
    And header Authorization = 'Bearer ' + token
    And request payload
    When method post
    Then status 201
    * def id = response.id
    * def name = response.name
    * def email = response.email
    * def status = response.status
    * karate.set('responseUser', response)


    Given path '/users/' + id
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And match response.id == id
    And match response.name == name
    And match response.email == email
    And match response.status == status
    And match response contains { id: '#number', name: '#string', email: '#string', status: '#string' }


