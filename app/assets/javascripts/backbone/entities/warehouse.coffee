Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Warehouse = Backbone.Model.extend
    urlRoot: 'warehouses'

  Entities.Warehouses = Backbone.Collection.extend
    url: 'warehouses'
    model: Entities.Warehouse

  API =
    getWarehouseEntities: ->
      result = (new Entities.Warehouses()).fetch()
      result

  Zeprj.reqres.setHandler 'warehouse:entities', ->
    API.getWarehouseEntities()