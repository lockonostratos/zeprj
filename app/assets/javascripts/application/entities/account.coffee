Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Account = Backbone.Model.extend
    urlRoot: 'accounts'

  Entities.Accounts = Sky.Collection.extend
    url: 'accounts'
    model: Entities.Account

  API =
    getAccountEntities: ->
      result = new Entities.Accounts()
      result.fetch()
      result

    getAccountEntity: (id) ->
      result = new Entities.Account({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'account:entities', ->
    API.getAccountEntities()

  Zeprj.reqres.setHandler 'account:entity', (id)->
    API.getAccountEntity(id)