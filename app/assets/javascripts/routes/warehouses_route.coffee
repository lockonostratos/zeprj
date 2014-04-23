Zeprj.WarehousesHomeRoute = Ember.Route.extend
  products: -> @store.find('product')

Zeprj.WarehousesImportRoute = Ember.Route.extend
  model: ->
