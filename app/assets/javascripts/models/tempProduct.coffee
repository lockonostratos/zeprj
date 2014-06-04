Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.TempProduct = Backbone.Model.extend
    urlRoot: 'temp_products'

  Entities.TempProducts = Sky.Collection.extend
    url: 'temp_products'
    model: Entities.TempProduct


  API =
    getTempProductEntities: (options)->
      result = new Entities.TempProducts()
      result.fetch(options)
      result

    getTempProductEntity: (id) ->
      result = new Entities.TempProduct({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'tempProduct:entities', (options) ->
    API.getTempProductEntities(options)

  Zeprj.reqres.setHandler 'tempProduct:entity', (id) ->
    API.getTempProductEntity(id)