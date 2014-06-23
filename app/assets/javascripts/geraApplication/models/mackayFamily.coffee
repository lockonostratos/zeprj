Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.MackayFamily = Backbone.Model.extend
    urlRoot: 'mackay_families'

  Entities.MackayFamilies = Sky.Collection.extend
    url: 'mackay_families'
    model: Entities.MackayFamily

  API =
    getMackayFamilyEntities: (options)->
      result = new Entities.MackayFamilies()
      result.fetch options
      result
    getMackayFamilyEntity: (id, options) ->
      result = new Entities.MackayFamily {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'mackayFamily:entities', (options)->
    API.getMackayFamilyEntities options
  Zeprj.reqres.setHandler 'mackayFamily:entity', (id, options)->
    API.getMackayFamilyEntity id, options
