Feature: API Tests with Karate Simpsons

Background:
  * url 'https://thesimpsonsapi.com/api'
  * def pageSize = 20
  

   
   Scenario: CP01 Listar personajes sin especificar página

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   When method get
   Then status 200
   And match response ==
   """
          {
            "count": "#number",
            "next": "##string",
            "prev": "##string",
            "pages": "#number",
            "results": "#array"
          }
          """

   Scenario: CP02 Listar personajes indicando página inválida

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   And param page = 'a'
   When method get
   Then status 200
   And match response ==
   """
          {
            "count": "#number",
            "next": "https://thesimpsonsapi.com/api/characters?page=2",
            "prev": null,
            "pages": "#number",
            "results": "#array"
          }
          """      
    
   Scenario: CP03 Listar personajes por página

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   And param page = 2
   When method get
   Then status 200
   And match response ==
   """
          {
            "count": "#number",
            "next": "https://thesimpsonsapi.com/api/characters?page=3",
            "prev": "https://thesimpsonsapi.com/api/characters?page=1",
            "pages": "#number",
            "results": "#array"
          }
          """

   Scenario: CP04 Listar personajes por ultima página

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   And param page = 60
   When method get
   Then status 200
   And match response ==
   """
          {
            "count": "#number",
            "next": null,
            "prev": "https://thesimpsonsapi.com/api/characters?page=59",
            "pages": "#number",
            "results": "#array"
          }
          """

   Scenario: CP05 Calculo de Metadatos en pagina 1

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   And param page = 1
   When method get
   Then status 200
   And match response.count == "#number"
   And assert response.results.length <= pageSize
   
   
   Scenario: CP06 Calculo de Metadatos en ultima pagina 

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   And param page = 60
   When method get
   Then status 200
   And match response.count == "#number"

   Scenario: CP07 Validar estructura minima de cada personaje en results

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   When method get
   Then status 200
   And match each response.results ==

      """
        {
            "id": "#number",
            "age": "##number",
            "birthdate": "##string",
            "gender": "#string",
            "name": "#string",
            "occupation": "##string",
            "phrases": "##array",
            "status": "#string",
            "portrait_path": "#string",
          }
          """

   Scenario: CP08 Detalle por ID 200

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   When method get
   Then status 200
   And match response.results[0].id == 1
   And match response.results[0].age == 39
   And match response.results[0].birthdate == '1956-05-12'
   And match response.results[0].gender == 'Male'
   And match response.results[0].name == 'Homer Simpson'
   And match response.results[0].occupation == 'Safety Inspector'
   And match response.results[0].portrait_path == '/character/1.webp'
   And match response.results[0].phrases == ["Doh!", "Why you little...!", "Woo-hoo!", "Mmm... (food)... *drooling*", "Stupid Flanders!", "Shut up Flanders!", "AAAAGHH!", "Lisa, knock off that racket!", "Uh oh, the boss.", "Lets all go out for frosty chocolate milkshakes!", "Whatever, Ill be at Moes.", "I am evil Ho-mer! I am evil Ho-mer! I am evil Ho-mer!", "Better them than me.", "Better them than me... Oh wait, that was me.", "Marge, my face hurts again!"]
   And match response.results[0].status == 'Alive'

   Scenario: CP09 Verificar ID inexistente


    Given path '/characters/10000'
    And header Content-Type = 'application/json; charset=utf-8'
    When method get
    Then status 404
    And match response ==
    """
            {
                "message": "Character not found",
                "error": "Not Found",
                "statusCode": 404
            }
        """

   Scenario: CP10 Verificar que el listado esta ordenado por ID
    Given path '/characters/'
    And header Content-Type = 'application/json; charset=utf-8'
    When method get
    Then status 200

    * def resultIds = karate.map(response.results, function(r){ return r.id })
    * def sortedIds = karate.sort(resultIds)

    And match resultIds == sortedIds

    

