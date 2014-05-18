Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Return = Backbone.Model.extend
    urlRoot: 'returns'

  Entities.Returns = Sky.Collection.extend
    url: 'returns'
    model: Entities.Return

  API =
    getReturnEntities: (options)->
      result = new Entities.Returns()
      result.fetch(options)
      result

    getReturnEntity: (id) ->
      result = new Entities.Return({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'return:entities', (options)->
    API.getReturnEntities(options)

  Zeprj.reqres.setHandler 'return:entity', (id)->
    API.getReturnEntity(id)