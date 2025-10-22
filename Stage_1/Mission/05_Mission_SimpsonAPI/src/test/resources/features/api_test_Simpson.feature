Feature: API Tests with Karate Simpsons

Background:
  * url 'https://thesimpsonsapi.com/api'

   
   Scenario: CP01 Listar personajes sin especificar página

   Given path '/characters'
   And header Content-Type = 'application/json; charset=utf-8'
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