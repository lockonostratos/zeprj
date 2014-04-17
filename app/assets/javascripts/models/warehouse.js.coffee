# for more details see: http://emberjs.com/guides/models/defining-models/

Zeprj.Warehouse = DS.Model.extend
  productCode: DS.attr 'string'
  skullCode: DS.attr 'string'
  merchantWarehouse: DS.attr 'number'
  name: DS.attr 'string'
  price: DS.attr 'number'
