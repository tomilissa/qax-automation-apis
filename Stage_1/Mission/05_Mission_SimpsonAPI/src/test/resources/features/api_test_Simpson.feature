Feature: API Tests with Karate Simpsons

Background:
  * url 'https://thesimpsonsapi.com/api'

   Scenario: CP01 Listar personajes

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