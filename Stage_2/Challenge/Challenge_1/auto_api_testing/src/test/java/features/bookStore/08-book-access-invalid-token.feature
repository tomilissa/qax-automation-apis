Feature: Agregar libro utilizando un Token inválido

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')
    * def userData = callonce read('classpath:features/bookStore/helpers/build-payload-user.feature')
    * def payload = userData.payload

@create1
  Scenario: CP08 — Agregar libro con Token inválido
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
    * def token =  12345

    * def requestPayload = read('classpath:data/add-book-payload.json')
    * requestPayload.userId = userId

    Given path '/BookStore/v1/Books'
    And header Authorization = 'Bearer ' + token
    And request requestPayload
    When method post
    Then status 401
    Then match response.code == '1200'
    And  match response.message == 'User not authorized!'