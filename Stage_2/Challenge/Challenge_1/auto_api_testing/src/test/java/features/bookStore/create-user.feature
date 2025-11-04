Feature: creación de Usuario y generación de token

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')
    * def userData = callonce read('classpath:features/bookStore/helpers/build-payload-user.feature')
    * def payload = userData.payload

  @create
  Scenario: CP-01 — CP02 - Crear usuario exitosamente y generación de Token
    Given path '/Account/v1/User'
    And request payload
    When method post
    Then status 201
    * def userId = response.userID
    * karate.set('responseUser', response)
    
    Given path '/Account/v1/GenerateToken'
    And request userData.payload
    When method post
    Then status 200
    And match response.token != null
    * def token =  response.token


