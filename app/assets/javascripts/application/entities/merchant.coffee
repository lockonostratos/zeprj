Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Merchant = Backbone.Model.extend
    urlRoot: 'merchants'

  Entities.Merchants = Sky.Collection.extend
    url: 'merchants'
    model: Entities.Merchant

  API =
    getMerchantEntities: (options)->
      result = new Entities.Merchants()
      result.fetch(options)
      result

    getMerchantEntity: (id) ->
      result = new Entities.Merchant({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'merchant:entities', (options)->
    API.getMerchantEntities(options)

  Zeprj.reqres.setHandler 'merchant:entity', (id)->
    API.getMerchantEntity(id)