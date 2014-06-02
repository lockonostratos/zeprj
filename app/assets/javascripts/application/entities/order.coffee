Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Order = Backbone.Model.extend
    urlRoot: 'orders'

  Entities.Orders = Sky.Collection.extend
    url: 'orders'
    model: Entities.Order

  API =
    getOrderEntities: (options)->
      result = new Entities.Orders()
      result.fetch(options)
      result

    getOrderEntity: (id) ->
      result = new Entities.Order({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'order:entities', (options)->
    API.getOrderEntities(options)

  Zeprj.reqres.setHandler 'order:entity', (id)->
    API.getOrderEntity(id)