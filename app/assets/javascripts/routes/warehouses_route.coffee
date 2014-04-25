Zeprj.WarehousesHomeRoute = Ember.Route.extend
  products: -> @store.find('product')

Zeprj.WarehousesImportRoute = Ember.Route.extend
  model: ->
    productSummaries: @store.find('account')


#Zeprj.WarehousesProductSummariesRoute = Ember.Route.extend
#  model: -> @store.find('account')