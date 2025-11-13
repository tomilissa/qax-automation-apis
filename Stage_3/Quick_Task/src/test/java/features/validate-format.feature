Feature: Validaciones de formatos de un objeto

Scenario: CP01 - Validar formatos numericos simples

* def response =
"""
{
  "id": 3,
  "price": 250,
  "quantity": 0
}
"""
* match response.id == '#number'
* match response.price == '#? _ > 200'
* match response.quantity == 0
* match response.quantity == '#? _ >= 0'


Scenario: CP02 - Validar formatos utilizando arrays

* def response =
"""
{
  "products": [
    { "id": 1, "price": 120 },
    { "id": 2, "price": 0 },
    { "id": 3, "price": 350 }
  ]
}
"""

* def validarId =
    """
    function(item){
      if (item.id <= 0) karate.fail('❌ ID inválido: ' + item.id)
    }
    """
    * karate.forEach(response.products, validarId)

* def validarPrice =
    """
    function(item){
      if (item.price <= 0) karate.fail('❌ Price inválido: ' + item.price + '  -  ' + 'ID asociado: ' + item.id)
    }
    """
    * karate.forEach(response.products, validarPrice)    