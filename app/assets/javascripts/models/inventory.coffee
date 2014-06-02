Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Inventory = Backbone.Model.extend
    urlRoot: 'inventories'

  Entities.Inventories = Sky.Collection.extend
    url: 'inventories'
    model: Entities.Inventory

  API =
    getInventoryEntities: (options)->
      result = new Entities.Inventories()
      result.fetch options
      result
    getInventoryEntity: (id) ->
      result = new Entities.Inventory {id: id}
      result.fetch()
      result

  Zeprj.reqres.setHandler 'inventory:entities', (options)->
    API.getInventoryEntities options
  Zeprj.reqres.setHandler 'inventory:entity', (id)->
    API.getInventoryEntity id
