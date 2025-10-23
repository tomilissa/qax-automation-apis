Feature: Generar email

Background:
* def baseUrl = 'https://jsonplaceholder.typicode.com'

Scenario: CP01 - Generar email unico

* def utils = callonce read('emailUtils.js')
* print utils.generarEmail()

* def payload = { name: 'tomaslissa', email: email }

Given url baseUrl
And path 'users'
When method post
Then status 201

* def Name = payload.name
* def Email = payload.email
* def idValidated = response.id

* print 'El id del usuario es:', idValidated
