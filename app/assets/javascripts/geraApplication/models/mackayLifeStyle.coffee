Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.MackayLifeStyle = Backbone.Model.extend
    urlRoot: 'mackay_life_styles'

  Entities.MackayLifeStyles = Sky.Collection.extend
    url: 'mackay_life_styles'
    model: Entities.MackayLifeStyle

  API =
    getMackayLifeStyleEntities: (options)->
      result = new Entities.MackayLifeStyles()
      result.fetch options
      result
    getMackayLifeStyleEntity: (id, options) ->
      result = new Entities.MackayLifeStyle {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'mackayLifeStyle:entities', (options)->
    API.getMackayLifeStyleEntities options
  Zeprj.reqres.setHandler 'mackayLifeStyle:entity', (id, options)->
    API.getMackayLifeStyleEntity id, options
