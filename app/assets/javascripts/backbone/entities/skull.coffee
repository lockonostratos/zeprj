Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Skull = Backbone.Model.extend
    urlRoot: 'skulls'

  Entities.Skulls = Sky.Collection.extend
    url: 'skulls'
    model: Entities.Skull

  API =
    getSkullEntities: (options)->
      result = new Entities.Skulls()
      result.fetch(options)
      result

    getSkullEntity: (id) ->
      result = new Entities.Skull({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'skull:entities', (options)->
    API.getSkullEntities(options)

  Zeprj.reqres.setHandler 'skull:entity', (id)->
    API.getSkullEntity(id)