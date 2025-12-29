Feature: Crear post exitosamente

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')

@create
Scenario: CP01 - Creación y consulta de post con user_id dinámico

    * def userData = call read('classpath:features/helpers/build-payload-user.feature')
    Given path '/users'
    And header Authorization = 'Bearer ' + token
    And request userData.payload
    When method post
    Then status 201
    * def createdUser = response
    * def dynamic_user_id = createdUser.id
    * match dynamic_user_id == '#number'


    * def postData = call read('classpath:features/helpers/build-payload-post.feature')
    * def postPayload = postData.payload
    * set postPayload.user_id = dynamic_user_id


    Given path '/posts'
    And header Authorization = 'Bearer ' + token
    And request postPayload
    When method post
    Then status 201
    * def createdPost = response
    * def post_id = createdPost.id


    Given path '/posts/', post_id
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And match response.id == post_id
    And match response.user_id == dynamic_user_id
    And match response.title == createdPost.title
    And match response.body == createdPost.body
    And match response contains { id: '#number', user_id: '#number', title: '#string', body: '#string' }