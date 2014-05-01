Zeprj.Merchant = DS.Model.extend
  accounts: DS.hasMany('merchantAccount')
  headquater_id: DS.attr('number')
  owner_id: DS.attr('number')
  name: DS.attr('string')