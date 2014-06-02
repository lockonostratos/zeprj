Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Delivery = Backbone.Model.extend
    urlRoot: 'deliveries'

  Entities.Deliveries = Sky.Collection.extend
    url: 'deliveries'
    model: Entities.Delivery

  API =
    getDeliveryEntities: (options)->
      result = new Entities.Deliveries()
      result.fetch(options)
      result

    getDeliveryEntity: (id) ->
      result = new Entities.Delivery({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'return:entities', (options)->
    API.getDeliveryEntities(options)

  Zeprj.reqres.setHandler 'return:entity', (id)->
    API.getDeliveryEntity(id)