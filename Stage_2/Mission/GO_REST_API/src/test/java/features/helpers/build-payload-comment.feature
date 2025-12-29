Feature: Helper para generar payload dinámico para un comentario

  Scenario: Crear payload dinámico para crear un nuevo comentario a una publicacion
    * def utils = call read('classpath:utils/utils.js')
    * def payload = read('classpath:data/comment-data.json')
    * set payload.name = utils.generarName()
    * set payload.email = utils.generarEmail()
    * set payload.body = utils.generarBody()