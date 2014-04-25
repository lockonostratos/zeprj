Zeprj.MerchantAccount = DS.Model.extend
  account: DS.belongsTo('account')
  merchant: DS.belongsTo('merchant')
  branch: DS.belongsTo('branch')
  current_warehouse_id: DS.attr('number')
  role_id: DS.attr('number')