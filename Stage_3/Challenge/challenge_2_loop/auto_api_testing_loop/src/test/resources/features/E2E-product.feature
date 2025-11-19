Feature: CRUD parcial sobre productos

Background:
  * url baseUrl
  * def payload = read('classpath:data/product-data.json')
  * configure headers = { 'Content-Type': 'application/json; charset=UTF-8' }

Scenario Outline: Flujo completo de creación y actualización de un producto usando PUT y PATCH

# --- Create a new product

Given path 'objects'
And request { "name": "<initialName>", "data": { "year": <initialYear>, "price": <initialPrice>, "CPU model": "<initialCPUModel>", "Hard disk size": "<initialHardDisk>" } }
When method post
Then status 200
And match response.id == '#string'
And match response.name == '#string'
And match response.data.year == '#number'
And match response.data.price == '#? _ > 0'
And match response.data.['CPU model'] == '#string'
And match response.data.['Hard disk size'] == '#string'
* def objectId = response.id
* print response

# --- Get new product created
Given path 'objects'
And param id = objectId
When method GET
Then status 200
And match response[0].id == objectId
And match response[0].name == '#string'
And match response[0].data == '#object'
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
* match response.id == objectId
* match response.name == '<putName>'
* match response.data.year == <putYear>
* match response.data.price == <putPrice>
* match response.data.CPUmodel == '<putCpu>'
* match response.data.hardDiskSize == '<putDisk>'

# --- Get updated product (PUT)
Given path 'objects'
And param id = objectId
When method GET
Then status 200
And match response[0].id == objectId
And match response[0].name == '<putName>'
And match response[0].data.year == <putYear>
And match response[0].data.price == <putPrice>
And match response[0].data.CPUmodel == '<putCpu>'
And match response[0].data.hardDiskSize == '<putDisk>'

# --- PATCH parcial al producto indicado ---
# Localiza el producto objetivo antes del parche (para comparar luego)
* def before = response
* print 'Producto ANTES del PATCH =>', before
# Construcción dinámica del payload PATCH:
# - Si el campo a parchear es en 'data', se envía { data: { <clave>: <valor> } }
# - Si es 'name', se envía { name: <valor> }
* def patchField = '<patchField>'
* def patchValue = '<patchValue>'
* def patchBody =
      """
      function(field, value){
        if (field === 'name') return { name: value };
        var o = {};
        o[field] = value;
        return { data: o };
      }
      """
* def body = patchBody(patchField, patchValue)
* print 'PATCH body =>', body

Given path 'objects', objectId
And request body
When method PATCH
Then status 200

# --- 3) Verificación por GET del recurso parchado ---
Given path 'objects'
And param id = objectId
When method GET
Then status 200
* match response == '#[1]'
* def after = response[0]

# Validación del valor parchado
* if (patchField === 'name') karate.match(after.name, patchValue)
* if (patchField !== 'name') karate.match(after.data[patchField], patchValue)

# Validar que lo no parchado se conserve (si existía)
* if (patchField !== 'name' && before.name) karate.match(after.name, before.name)
* if (patchField === 'name' && before.data) karate.match(after.data, '#object')

# --- Reglas de integridad

# --- 1. Verificar que los ids son únicos y numéricos
Given path 'objects'
When method GET
Then status 200
* match response == '#[]'
* def products = response

# Validar que todas las entradas tienen la estructura esperada y data sea un objeto
* match each products contains { id: '#string', name: '#string', data: '##object' }

* def ids = products.map(x => x.id)
# Nota: => x.id: Le indica a map que, para cada objeto x, devuelva solo el valor de su propiedad id.
* def uniqueIds = karate.distinct(ids)
* if (ids.length != uniqueIds.length) karate.fail('❌ IDs duplicados en listado')
* karate.forEach(ids, function(v){ if (!/^[0-9]+$/.test(v)) karate.fail('❌ ID no numérico: ' + v) })

# --- 2. data.price > 0 cuando price es #number

* def dataPrice =
      """
      function(item){
        if (item.data && typeof item.data.price === 'number' && !(item.data.price > 0)) {
          karate.fail('❌ price inválido para id=' + item.id + ' -> ' + item.data.price);
        }
      }
      """
* karate.forEach(products, dataPrice)

# --- 3. Campos numéricos esperados si existen (capacity GB, Screen size)
* def dataCapacityScreenSize =
      """
      function(item){
        if (item.data && item.data['capacity GB'] !== undefined && typeof item.data['capacity GB'] !== 'number') {
          karate.fail('❌ capacity GB debe ser number en id=' + item.id);
        }
        if (item.data && item.data['Screen size'] !== undefined && typeof item.data['Screen size'] !== 'number') {
          karate.fail('❌ Screen size debe ser number en id=' + item.id);
        }

      }
      """

* karate.forEach(products,dataCapacityScreenSize)



Examples: 
| karate.read('classpath:data/product-data-2.json') |