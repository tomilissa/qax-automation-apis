Feature: Crear, consultar y reemplazar datos usando el método PUT con DDT 

Background:
  * url baseUrl
  * def payload = read('classpath:data/product-data.json')
  * configure headers = { 'Content-Type': 'application/json; charset=UTF-8' }


Scenario Outline: Flujo completo de creación y actualización de un producto

# --- Create a new product

Given path 'objects'
And request { "name": "<initialName>", "data": { "year": <initialYear>, "price": <initialPrice>, "CPU model": "<initialCPUModel>", "Hard disk size": "<initialHardDisk>" } }
When method post
Then status 200
And match response.id == '#string'
And match response.name == '<initialName>'
And match response.data.year == <initialYear>
* def objectId = response.id
* print response


# --- Get new product created
Given path 'objects'
And param id = objectId
When method GET
Then status 200
And match response[0].name == '<initialName>'
* print response

# --- PUT (reemplazo total del producto) ---
* set payload.name = '<putName>'
* set payload.data.year = <putYear>
* set payload.data.price = <putPrice>
* set payload.data.CPUmodel = '<putCpu>'
* set payload.data.hardDiskSize = '<putDisk>'
* print 'Payload para PUT:', payload
Given path 'objects', objectId
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
And param id = objectId
When method GET
Then status 200
* def obj = response[0]
* match obj.name == '<putName>'
* match obj.data.year == <putYear>
* match obj.data.price == <putPrice>
* match obj.data.CPUmodel == '<putCpu>'
* match obj.data.hardDiskSize == '<putDisk>'

Examples: 
| karate.read('classpath:data/product-data-2.json') |
