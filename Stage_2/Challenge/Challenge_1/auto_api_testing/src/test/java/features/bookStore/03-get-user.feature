Feature: Gestión de la información del usuario en DemoQA

  Background:
    * url baseUrl
    * def userNew = call read('create-user.feature')

  @get
  Scenario: CP03 - Obtener info del usuario con token válido
    Given path '/Account/v1/User/' + userNew.responseUser.userID
    And header Authorization = 'Bearer ' +  userNew.token
    When method get
    Then status 200
    And match response.userId == userNew.responseUser.userID
