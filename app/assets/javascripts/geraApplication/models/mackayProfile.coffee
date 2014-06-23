Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.MackayProfile = Backbone.Model.extend
    urlRoot: 'mackay_profiles'

  Entities.MackayProfiles = Sky.Collection.extend
    url: 'mackay_profiles'
    model: Entities.MackayProfile

  API =
    getMackayProfileEntities: (options)->
      result = new Entities.MackayProfiles()
      result.fetch options
      result
    getMackayProfileEntity: (id, options) ->
      result = new Entities.MackayProfile {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'mackayProfile:entities', (options)->
    API.getMackayProfileEntities options
  Zeprj.reqres.setHandler 'mackayProfile:entity', (id, options)->
    API.getMackayProfileEntity id, options
