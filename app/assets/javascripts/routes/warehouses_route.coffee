Zeprj.WarehousesHomeRoute = Ember.Route.extend
  model: -> @store.find('account')

Zeprj.WarehousesImportRoute = Ember.Route.extend
  model: ->
    Ember.RSVP.hash
      productSummaries: @store.find('account')
      currentImportDetails: @store.find('account')

#Zeprj.WarehousesProductSummariesRoute = Ember.Route.extend
#  model: -> @modelFor("WarehousesHome")

#Zeprj.ProductSummariesRoute = Ember.Route.extend
#  model: -> @store.find("productSummaries")
