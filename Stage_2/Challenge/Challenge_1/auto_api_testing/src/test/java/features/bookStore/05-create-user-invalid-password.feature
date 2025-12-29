Feature: creación de Usuario con Password invalida

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')
    * def userData = callonce read('classpath:features/bookStore/helpers/build-payload-invalid-password.feature')
    * def payload = userData.payload
    * def expectedMessage = "Passwords must have at least one non alphanumeric character, one digit ('0'-'9'), one uppercase ('A'-'Z'), one lowercase ('a'-'z'), one special character and Password must be eight characters or longer."

  @create1
  Scenario: CP05 — Crear usuario con Password inválida
    Given path '/Account/v1/User'
    And request payload
    When method post
    Then status 400
    And match response.code == '1300'
    And match response.message == expectedMessage