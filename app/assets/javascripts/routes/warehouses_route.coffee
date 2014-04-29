Zeprj.WarehousesHomeRoute = Ember.Route.extend
  model: -> @store.find('account')

#Zeprj.WarehousesImportRoute = Ember.Route.extend
#  model: ->
#    productSummaries: -> @store.find('productSummaries')

#Zeprj.WarehousesProductSummariesRoute = Ember.Route.extend
#  model: -> @modelFor("WarehousesHome")
