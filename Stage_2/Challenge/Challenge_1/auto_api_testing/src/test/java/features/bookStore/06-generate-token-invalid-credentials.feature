Feature: Generación de token con datos invalidos

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')
    * def userData = callonce read('classpath:features/bookStore/helpers/build-payload-invalid-password.feature')
    * def payload = userData.payload

  @create1
  Scenario: CP06 — Generación de token con datos invalidos
    
    Given path '/Account/v1/GenerateToken'
    And request userData.payload
    When method post
    Then status 200
    And match response.status == 'Failed'
    And match response.result == 'User authorization failed.'