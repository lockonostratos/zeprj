Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.InventoryDetail = Backbone.Model.extend
    urlRoot: 'inventory_details'

  Entities.InventoryDetails = Sky.Collection.extend
    url: 'inventory_details'
    model: Entities.InventoryDetail

  API =
    getInventoryDetailEntities: (options)->
      result = new Entities.InventoryDetails()
      result.fetch(options)
      result

    getInventoryDetailEntity: (id) ->
      result = new Entities.InventoryDetail({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'inventoryDetail:entities', (options)->
    API.getInventoryDetailEntities(options)

  Zeprj.reqres.setHandler 'inventoryDetail:entity', (id)->
    API.getInventoryDetailEntity(id)