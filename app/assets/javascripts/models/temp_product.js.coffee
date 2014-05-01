Zeprj.TempProduct = DS.Model.extend
  product_code: DS.attr('string')
  skull: DS.belongsTo('skull')
  provider: DS.belongsTo('provider')
  warehouse: DS.belongsTo('warehouse')
  creator: DS.belongsTo('merchantAccount')

  name: DS.attr('string')
  import_quality: DS.attr('number')
  import_price: DS.attr('number')
  expire: DS.attr('date')