Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Warehouse = Backbone.Model.extend
    urlRoot: 'warehouses'

  Entities.Warehouses = Backbone.Collection.extend
    url: 'warehouses'
    model: Entities.Warehouse

  API =
    getWarehouseEntities: ->
      warehouses = new Entities.Warehouses()
      warehouses.fetch()

  Zeprj.reqres.setHandler 'warehouse:entities', ->
    API.getWarehouseEntities()