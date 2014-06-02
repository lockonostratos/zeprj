Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.OrderDetail = Backbone.Model.extend
    urlRoot: 'order_details'

  Entities.OrderDetails = Sky.Collection.extend
    url: 'order_details'
    model: Entities.OrderDetail

  API =
    getOrderDetailEntities: (options)->
      result = new Entities.OrderDetails()
      result.fetch(options)
      result

    getOrderDetailEntity: (id) ->
      result = new Entities.OrderDetail({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'orderDetail:entities', (options)->
    API.getOrderDetailEntities(options)

  Zeprj.reqres.setHandler 'orderDetail:entity', (id)->
    API.getOrderDetailEntity(id)