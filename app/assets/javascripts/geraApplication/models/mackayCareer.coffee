Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.MackayCareer = Backbone.Model.extend
    urlRoot: 'mackay_careers'

  Entities.MackayCareers = Sky.Collection.extend
    url: 'mackay_careers'
    model: Entities.MackayCareer

  API =
    getMackayCareerEntities: (options)->
      result = new Entities.MackayCareers()
      result.fetch options
      result
    getMackayCareerEntity: (id, options) ->
      result = new Entities.MackayCareer {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'mackayCareer:entities', (options)->
    API.getMackayCareerEntities options
  Zeprj.reqres.setHandler 'mackayCareer:entity', (id, options)->
    API.getMackayCareerEntity id, options
