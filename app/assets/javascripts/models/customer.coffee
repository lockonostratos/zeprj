Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Customer = Backbone.Model.extend
    urlRoot: 'customers'

  Entities.Customers = Sky.Collection.extend
    url: 'customers'
    model: Entities.Customer

  API =
    getCustomerEntities: (options)->
      result = new Entities.Customers()
      result.fetch options
      result

    getCustomerEntity: (id) ->
      result = new Entities.Customer({id: id})
      result.fetch()
      result


  Zeprj.reqres.setHandler 'customer:entities', ->
    API.getCustomerEntities()

  Zeprj.reqres.setHandler 'customer:entity', (id)->
    API.getCustomerEntity(id)