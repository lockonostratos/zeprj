Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.MackayPersonal = Backbone.Model.extend
    urlRoot: 'mackay_personals'

  Entities.MackayPersonals = Sky.Collection.extend
    url: 'mackay_personals'
    model: Entities.MackayPersonal

  API =
    getMackayPersonalEntities: (options)->
      result = new Entities.MackayPersonals()
      result.fetch options
      result
    getMackayPersonalEntity: (id, options) ->
      result = new Entities.MackayPersonal {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'mackayPersonal:entities', (options)->
    API.getMackayPersonalEntities options
  Zeprj.reqres.setHandler 'mackayPersonal:entity', (id, options)->
    API.getMackayPersonalEntity id, options
