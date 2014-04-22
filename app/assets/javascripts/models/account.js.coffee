Zeprj.Account = DS.Model.extend
  email: DS.attr('string')
  display_name: DS.attr('string')

Zeprj.MerchantAccount = DS.Model.extend
  merchant_id: DS.attr('number')
  branch_id: DS.attr('number')
  current_warehouse_id: DS.attr('number')