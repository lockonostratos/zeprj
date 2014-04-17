# for more details see: http://emberjs.com/guides/models/defining-models/

Zeprj.MerWarehouse = DS.Model.extend
  brancheId: DS.attr 'number'
  name: DS.attr 'string'
  location: DS.attr 'string'
