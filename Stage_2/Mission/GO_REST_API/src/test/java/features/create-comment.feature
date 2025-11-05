Feature: Creación de un comment asociado a un post

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')

@create
Scenario: CP01 - Creación de un comment asociado a un post

    * def commentData = call read('classpath:features/helpers/build-payload-comment.feature')
    * def commentPayload = commentData.payload
    * set commentPayload.post_id = 256484


    Given path '/posts/', commentPayload.post_id, '/comments'
    And header Authorization = 'Bearer ' + token
    And request commentPayload
    When method post
    Then status 201
    * def createdComment = response
    * def comment_id = createdComment.id
    * match createdComment.post_id == commentPayload.post_id
    * match createdComment.email == commentPayload.email


    Given path '/posts/', createdComment.post_id, '/comments'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And match response contains { id: '#(comment_id)', post_id: '#(createdComment.post_id)', name: '#(createdComment.name)', email: '#(createdComment.email)', body: '#(createdComment.body)' }