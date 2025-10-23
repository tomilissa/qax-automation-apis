Feature: Generate email

Background:
* def baseUrl = 'https://jsonplaceholder.typicode.com'
  

Scenario: Generate email unico

* def genEmail = function generarMail(name){ return name + new Date().getTime() + '@qaxpert.com' }
* def email = genEmail('tomaslissa')
* print 'Email generado =', email

* def payload = { name: 'tomaslissa', email: email }

Given url baseUrl
And path 'users'
When method post
Then status 201

* def idValidated = response.id

* print 'El id del usuario es:', idValidated