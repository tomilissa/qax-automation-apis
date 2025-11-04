Feature: Buscar libro y agregarlo a un usuario

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')
    * def userData = callonce read('classpath:features/bookStore/helpers/build-payload-user.feature')
    * def payload = userData.payload


@create1
  Scenario: CP09 — Agregar libro con Token válido
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

    * def requestPayload = read('classpath:data/add-book-payload.json')
    * requestPayload.userId = userId

    Given path '/BookStore/v1/Books'
    And header Authorization = 'Bearer ' + token
    And request requestPayload
    When method post
    Then status 201
    Then match response.books[0].isbn == '9781449325862'