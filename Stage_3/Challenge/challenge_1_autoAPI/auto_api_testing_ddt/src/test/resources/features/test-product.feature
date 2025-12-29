Feature: Crear -> Ver -> Reemplazo total (PUT) con DDT

Background:
  * url baseUrl
  * def payload = read('classpath:data/product-data.json')
  * configure headers = { 'Content-Type': 'application/json; charset=UTF-8' }
  * print '=========================================='
  * print 'Iniciando nuevo test'
  * print '=========================================='

  Scenario Outline: Flujo completo con datos parametrizados
    # --- PUT (reemplazo total) ---
    * set payload.name = '<putName>'
    * set payload.data.year = <putYear>
    * set payload.data.price = <putPrice>
    * set payload.data.CPUmodel = '<putCpu>'
    * set payload.data.hardDiskSize = '<putDisk>'
    * print 'Payload para PUT:', payload
    Given path 'objects', '<createdId>'
    And request payload
    When method PUT
    Then status 200
    * match response.name == '<putName>'
    * match response.data.year == <putYear>
    * match response.data.price == <putPrice>
    * match response.data.CPUmodel == '<putCpu>'
    * match response.data.hardDiskSize == '<putDisk>'

    # --- READ FINAL ---
    Given path 'objects'
    And param id = '<createdId>'
    When method GET
    Then status 200
    * def obj = response[0]
    * match obj.name == '<putName>'
    * match obj.data.year == <putYear>
    * match obj.data.price == <putPrice>
    * match obj.data.CPUmodel == '<putCpu>'
    * match obj.data.hardDiskSize == '<putDisk>'

    Examples:
    | createdId                        | putName      | putYear | putPrice | putCpu   | putDisk |
    | ff8081819782e69e019a546020375f4f | Dell XPS 14  | 2021    | 1000.00  | Intel i5 | 1 TB    |
    | ff8081819782e69e019a7a23f4ec4883 | Asus Zenbook | 2022    | 1100.35  | Intel i6 | 2 TB    |
    | ff8081819782e69e019a7f1bb1255a3e | Notebook Dell| 2023    | 1200.00  | Intel i7 | 3 TB    |
    | ff8081819782e69e019a7f1d70a75a40 | Windows Book | 2024    | 1300.00  | Intel i8 | 4 TB    |
    | ff8081819782e69e019a827974ef6370 | Mac Book     | 2025    | 590.99   | Intel i9 | 5 TB    |
    
    
