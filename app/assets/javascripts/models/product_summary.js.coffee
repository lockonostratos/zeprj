Zeprj.ProductSummary = DS.Model.extend
  product_code: DS.attr('string')
  skull_id: DS.attr('number')
  warehouse_id: DS.attr('number')
  account_id: DS.attr('number')

  name: DS.attr('string')
  quality: DS.attr('number')
  price: DS.attr('number')