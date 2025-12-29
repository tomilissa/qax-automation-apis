Feature: Helper para generar payload dinámico para publicacion

  Scenario: Crear payload dinámico para una nueva publicacion
    * def utils = call read('classpath:utils/utils.js')
    * def payload = read('classpath:data/post-data.json')
    * def title = utils.generarTitulo()
    * def body = utils.generarBody()
    * set payload.title = title
    * set payload.body = body
    * karate.set('payload', payload)
    * karate.set('title', title)
    * karate.set('body', body)