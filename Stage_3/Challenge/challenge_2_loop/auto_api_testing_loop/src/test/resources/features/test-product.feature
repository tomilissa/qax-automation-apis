Feature: Validar listado de productos y realizar PATCH con DDT

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json; charset=UTF-8' }

  Scenario Outline: Listado completo (GET) + PATCH parcial y verificación
    # --- 1) GET listado completo ---
    Given path 'objects'
    When method GET
    Then status 200
    # Validar que la respuesta es una lista (posiblemente vacía)
    * match response == '#[]'
    * def products = response

    # Validar que todas las entradas tienen la estructura esperada y data sea un objeto
    #* match each products contains { id: '#string', name: '#string', data: '#object' }
    # Validar que todas las entradas tienen la estructura esperada y data sea un objeto opcional, es decir puede venir null
    * match each products contains { id: '#string', name: '#string', data: '##object' }

    # Reglas de integridad con loops y condicionales
    # 1. IDs únicos y numéricos
    * def ids = products.map(x => x.id)
    * def uniqueIds = karate.distinct(ids)
    * if (ids.length != uniqueIds.length) karate.fail('❌ IDs duplicados en listado')
    * karate.forEach(ids, function(v){ if (!/^[0-9]+$/.test(v)) karate.fail('❌ ID no numérico: ' + v) })

    # 2. data.price > 0 cuando price es #number

    * def dataPrice =
      """
      function(item){
        if (item.data && typeof item.data.price === 'number' && !(item.data.price > 0)) {
          karate.fail('❌ price inválido para id=' + item.id + ' -> ' + item.data.price);
        }
      }
      """
    * karate.forEach(products, dataPrice)

    # 3. Campos numéricos esperados si existen (capacity GB, Screen size)
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

    # --- 2) PATCH parcial al producto indicado ---
    # Localiza el producto objetivo antes del parche (para comparar luego)
    * def targetId = '<patchId>'
    * def before = response
    * print 'Producto ANTES del PATCH =>', before
    # Construcción dinámica del payload PATCH:
    # - Si el campo a parchear es en 'data', se envía { data: { <clave>: <valor> } }
    # - Si es 'name', se envía { name: <valor> }
    * def patchField = '<patchField>'
    * def patchValue = <patchValue>
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

    Given path 'objects', targetId
    And request body
    When method PATCH
    Then status 200

    # --- 3) Verificación por GET del recurso parchado ---
    Given path 'objects'
    And param id = targetId
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

    Examples:
      # 1) Cambiar solo el nombre del producto con id 7
      | patchId                                | patchField | patchValue        |
      | ff8081819782e69e019a546020375f4f       | name       | 'Apple MacBook X' |

      # 2) Cambiar solo el price en data del producto con id 4
      | ff8081819782e69e019a546020375f4f       | price      | 399.99            |

      # 3) Agregar/Actualizar 'capacity GB' como number en id 3
      | ff8081819782e69e019a546020375f4f       | capacity GB | 1024           |