Feature: Agregar libro sin especificar Token (Acceso protegido sin token)

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')
    * def userData = callonce read('classpath:features/bookStore/helpers/build-payload-user.feature')
    * def payload = userData.payload

  @create1
  Scenario: CP07 — Agregar libro sin especificar Token (Acceso protegido sin token)
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

    Given path '/BookStore/v1/Books'
    And request
          """
          {
            "userId": "{{userId}}",
            "collectionOfIsbns": [
          {
            "isbn": "9781449325862"
                 }
             ]
            }

          """
    When method post
    Then match response.code == '1200'
    And  match response.message == 'User not authorized!'


