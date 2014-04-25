Zeprj.Import = DS.Model.extend
  warehouse: DS.belongsTo('warehouse')
  description: DS.attr('string')