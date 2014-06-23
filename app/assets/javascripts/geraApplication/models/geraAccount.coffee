Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.GeraAccount = Backbone.Model.extend
    urlRoot: 'gera_accounts'

  Entities.GeraAccounts = Sky.Collection.extend
    url: 'gera_accounts'
    model: Entities.GeraAccount

  API =
    getGeraAccountEntities: (options)->
      result = new Entities.GeraAccounts()
      result.fetch options
      result
    getGeraAccountEntity: (id, options) ->
      result = new Entities.GeraAccount {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'geraAccount:entities', (options)->
    API.getGeraAccountEntities options
  Zeprj.reqres.setHandler 'geraAccount:entity', (id, options)->
    API.getGeraAccountEntity id, options
