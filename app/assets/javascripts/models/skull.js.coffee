Zeprj.Skull = DS.Model.extend
  merchantAccount: DS.belongsTo('merchant_account')
  merchant: DS.belongsTo('merchant')

  skull_code: DS.attr('string')
  description: DS.attr('description')