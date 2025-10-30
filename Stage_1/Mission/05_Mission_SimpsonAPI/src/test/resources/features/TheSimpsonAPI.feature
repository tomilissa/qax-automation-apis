Feature: Exponer listado y detalle de personajes de The Simpsons con paginación
  
  Background:
    * url baseUrl

  Scenario: CP01 Listar personajes sin especificar página

   Given path '/characters'
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

Scenario: CP02 - Listar personajes por página

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

Scenario: CP03 - Listar personajes indicando una página inexistente

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   And param page = '250'
   When method get
   Then status 200
   And match response ==
   """
          {
            "count": "#number",
            "next": null,
            "prev": null,
            "pages": "#number",
            "results": "#array"
          }
          """ 

   Scenario: CP04 - Listar personajes indicando página inválida

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   And param page = '-1'
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
    
   
   Scenario: CP05 - Listar personajes por ultima página

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

   Scenario: CP06 - Validar estructura minima de cada personaje en results

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
   When method get
   Then status 200

   * def isBirthdateValid = function(v) { return v == null || v.matches('^\\d{4}-\\d{2}-\\d{2}$') }
   * def isPortraitPathValid = function(v) { return v == null || v.matches('^/character/\\d+\\.webp$') }

   And match each response.results ==

      """
        {
            "id": "#number",
            "age": "##number",
            "birthdate": "#? isBirthdateValid(_)",
            "gender": "#string",
            "name": "#string",
            "occupation": "##string",
            "phrases": "#array",
            "status": "#string",
            "portrait_path": "#? isPortraitPathValid(_)",
          }
          """

   Scenario: CP07 - Obtener info del personaje por ID

   Given path '/characters/1'
   And header Content-Type = 'application/json; charset=utf-8'
   When method get
   Then status 200
   And match response.id == 1
   And match response.age == 39
   And match response.birthdate == '1956-05-12'
   And match response.gender == 'Male'
   And match response.name == 'Homer Simpson'
   And match response.occupation == 'Safety Inspector'
   And match response.portrait_path == '/character/1.webp'
   And match response.phrases == ["Doh!", "Why you little...!", "Woo-hoo!", "Mmm... (food)... *drooling*", "Stupid Flanders!", "Shut up Flanders!", "AAAAGHH!", "Lisa, knock off that racket!", "Uh oh, the boss.", "Lets all go out for frosty chocolate milkshakes!", "Whatever, Ill be at Moes.", "I am evil Ho-mer! I am evil Ho-mer! I am evil Ho-mer!", "Better them than me.", "Better them than me... Oh wait, that was me.", "Marge, my face hurts again!"]
   And match response.status == 'Alive'

   Scenario: CP08 - Obtener info del personaje por ID invalido

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

   Scenario: CP9 - Verificar que el listado esta ordenado por ID
    Given path '/characters/'
    And header Content-Type = 'application/json; charset=utf-8'
    When method get
    Then status 200

    * def resultIds = karate.map(response.results, function(r){ return r.id })
    * def sortedIds = karate.sort(resultIds)

    And match resultIds == sortedIds

    

