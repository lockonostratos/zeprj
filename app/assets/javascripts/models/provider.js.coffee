Zeprj.Provider = DS.Model.extend
  merchant: DS.belongsTo('merchant')
  name: DS.attr('string')