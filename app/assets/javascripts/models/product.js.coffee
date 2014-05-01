Zeprj.Product = DS.Model.extend
  product_code: DS.attr('string')
  skull_id: DS.attr('number')
  provider_id: DS.attr('number')
  warehouse_id: DS.attr('number')

  name: DS.attr('string')
  price: DS.attr('number')