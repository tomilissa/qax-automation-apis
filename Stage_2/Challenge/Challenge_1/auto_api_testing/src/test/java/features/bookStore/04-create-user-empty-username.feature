Feature: creación de Usuario con userName vacío

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')
    * def userData = callonce read('classpath:features/bookStore/helpers/build-payload-empty-user-name.feature')
    * def payload = userData.payload

  @create1
  Scenario: CP04 — Crear usuario con username vacío
    Given path '/Account/v1/User'
    And request payload
    When method post
    Then status 400
    And match response.code == '1200'
    And match response.message == 'UserName and Password required.'
