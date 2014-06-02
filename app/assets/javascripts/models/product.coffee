Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Product = Backbone.Model.extend
    urlRoot: 'products'

  Entities.Products = Sky.Collection.extend
    url: 'products'
    model: Entities.Product

  API =
    getProductEntities: (options)->
      result = new Entities.Products()
      result.fetch(options)
      result

    getProductEntity: (id) ->
      result = new Entities.Product({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'product:entities', (options)->
    API.getProductEntities(options)

  Zeprj.reqres.setHandler 'product:entity', (id)->
    API.getProductEntity(id)