Feature: Generar email

Background:
* def baseUrl = 'https://jsonplaceholder.typicode.com'

Scenario: CP01 - Generar email unico

* def utils = callonce read('classpath:utils/emailUtils.js')
* def email = utils.generarEmail()

* def payload = { name: 'tomaslissa', email: email }

Given url baseUrl
And path 'users'
When method post
Then status 201

* def nameValidated = payload.name
* def idValidated = response.id

* print 'El id del usuario es:', idValidated
* print 'El nombre del usuario es:', nameValidated
* print 'El email del usuario es:', email

