Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.MerchantAccount = Backbone.Model.extend
    urlRoot: 'merchant_accounts'

  Entities.MerchantAccounts = Backbone.Collection.extend
    url: 'merchant_accounts'
    model: Entities.MerchantAccount

  API =
    getMerchantAccountEntities: ->
      result = new Entities.MerchantAccounts()
      result.fetch()
      result

    getMerchantAccountEntity: (id) ->
      result = new Entities.MerchantAccount({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'merchantAccount:entities', ->
    API.getMerchantAccountEntities()

  Zeprj.reqres.setHandler 'merchantAccount:entity', (id)->
    API.getMerchantAccountEntity(id)