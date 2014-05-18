Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Provider = Backbone.Model.extend
    urlRoot: 'providers'

  Entities.Providers = Sky.Collection.extend
    url: 'providers'
    model: Entities.Provider

  API =
    getProviderEntities: (options)->
      result = new Entities.Providers()
      result.fetch(options)
      result

    getProviderEntity: (id) ->
      result = new Entities.Provider({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'provider:entities', (options)->
    API.getProviderEntities(options)

  Zeprj.reqres.setHandler 'provider:entity', (id)->
    API.getProviderEntity(id)