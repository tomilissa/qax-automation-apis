Feature: Helper para generar payload dinámico para user

  Scenario: Crear payload dinámico para un nuevo usuario
    * def utils = call read('classpath:utils/utils.js')
    * def payload = read('classpath:data/user-data.json')
    * set payload.name = utils.generarName()
    * set payload.gender = utils.generarGender()
    * set payload.email = utils.generarEmail()
    * set payload.status = 'active'
