Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.TempInventoryDetail = Backbone.Model.extend
    urlRoot: 'temp_inventory_details'

  Entities.TempInventoryDetails = Sky.Collection.extend
    url: 'temp_inventory_details'
    model: Entities.TempInventoryDetail

  API =
    getTempInventoryDetailEntities: (options)->
      result = new Entities.TempInventoryDetails()
      result.fetch(options)
      result

    getTempInventoryDetailEntity: (id) ->
      result = new Entities.TempInventoryDetail({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'tempInventoryDetail:entities', (options)->
    API.getTempInventoryDetailEntities(options)

  Zeprj.reqres.setHandler 'tempInventoryDetail:entity', (id)->
    API.getTempInventoryDetailEntity(id)