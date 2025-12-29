Feature: Creación de usuario, post y comment (E2E)

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')

@create
Scenario: CP01 - Creación de usuario, post y comment

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


    * def commentData = call read('classpath:features/helpers/build-payload-comment.feature')
    * def commentPayload = commentData.payload
    * set commentPayload.post_id = post_id


    Given path '/posts/', post_id, '/comments'
    And header Authorization = 'Bearer ' + token
    And request commentPayload
    When method post
    Then status 201
    * def createdComment = response
    * def comment_id = createdComment.id
    * match createdComment.post_id == post_id
    * match createdComment.email == commentPayload.email


    Given path '/posts/', post_id, '/comments'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And match response contains { id: '#(comment_id)', post_id: '#(post_id)', name: '#(createdComment.name)', email: '#(createdComment.email)', body: '#(createdComment.body)' }




