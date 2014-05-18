Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Warehouse = Backbone.Model.extend
    urlRoot: 'warehouses'

  Entities.Warehouses = Sky.Collection.extend
    url: 'warehouses'
    model: Entities.Warehouse

  API =
    getWarehouseEntities: (options)->
      result = new Entities.Warehouses()
      result.fetch options
      result
    getWarehouseEntity: (id, options) ->
      result = new Entities.Warehouse {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'warehouse:entities', (options)->
    API.getWarehouseEntities options
  Zeprj.reqres.setHandler 'warehouse:entity', (id, options)->
    API.getWarehouseEntity id, options
