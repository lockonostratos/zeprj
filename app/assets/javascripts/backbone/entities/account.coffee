Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Account = Backbone.Model.extend
    urlRoot: 'accounts'

  Entities.Accounts = Backbone.Collection.extend
    url: 'accounts'
    model: Entities.Account

  API =
    getAccountEntities: ->
      results = new Entities.Accounts()
      results.fetch()

    getAccountEntity: (id) ->
      result = new Entities.Account({id: id})
      result.fetch()

  Zeprj.reqres.setHandler 'account:entities', ->
    API.getAccountEntities()

  Zeprj.reqres.setHandler 'account:entity', (id)->
    API.getAccountEntity(id)