Feature: Helper para generar payload dinámico

  Scenario: Crear payload dinámico para un post
     # 0. Leer utils.js
    * def utils = call read('classpath:utils/utils.js')
    # 1. Leer JSON base
    * def payload = read('classpath:data/post-data.json')

    # 2. Generar datos dinámicos usando utils.js
    * def title = utils.generarTitulo()
    * def body = utils.generarBody()
    * def userId = utils.generarUserId()

    # 3. Setear los valores dinámicos dentro del payload
    * set payload.title = title
    * set payload.body = body
    * set payload.userId = userId

    * print payload

     # 4. Pasar variables al escenario principal
    * karate.set('payload', payload)
    * karate.set('title', title)
    * karate.set('body', body)
    * karate.set('userId', userId)