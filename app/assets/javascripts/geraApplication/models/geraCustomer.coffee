Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.GeraCustomer = Backbone.Model.extend
    urlRoot: 'gera_customers'

  Entities.GeraCustomers = Sky.Collection.extend
    url: 'gera_customers'
    model: Entities.GeraCustomer

  API =
    getGeraCustomerEntities: (options)->
      result = new Entities.GeraCustomers()
      result.fetch options
      result
    getGeraCustomerEntity: (id, options) ->
      result = new Entities.GeraCustomer {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'geraCustomer:entities', (options)->
    API.getGeraCustomerEntities options
  Zeprj.reqres.setHandler 'geraCustomer:entity', (id, options)->
    API.getGeraCustomerEntity id, options
