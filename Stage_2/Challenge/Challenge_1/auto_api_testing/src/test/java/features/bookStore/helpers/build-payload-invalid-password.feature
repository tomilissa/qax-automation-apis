Feature: Helper para generar payload dinámico para user

  Scenario: Crear payload dinámico para un nuevo usuario
    * def utils = call read('classpath:utils/utils.js')
    * def payload = read('classpath:data/user-data.json')
    * def userName = 'utils.generarUsername()'
    * def pass = utils.generarPasswordInvalida()
    #* def pass = 'Test@@1234'
    * print userName
    * print pass
    * set payload.userName = userName
    * set payload.password = pass
    * karate.set('payload', payload)
    * karate.set('userName', userName)
    * karate.set('password', pass)