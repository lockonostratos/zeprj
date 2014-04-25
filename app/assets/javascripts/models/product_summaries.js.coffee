Zeprj.ProductSummaries = DS.Model.extend
  product_code: DS.attr('string')
  skull_id: DS.attr('number')
  warehouse: DS.belongsTo('warehouse')

  name: DS.attr('string')
  quality: DS.attr('number')
  price: DS.attr('number')