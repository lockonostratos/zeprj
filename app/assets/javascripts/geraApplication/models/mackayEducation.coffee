Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.MackayEducation = Backbone.Model.extend
    urlRoot: 'mackay_educations'

  Entities.MackayEducations = Sky.Collection.extend
    url: 'mackay_educations'
    model: Entities.MackayEducation

  API =
    getMackayEducationEntities: (options)->
      result = new Entities.MackayEducations()
      result.fetch options
      result
    getMackayEducationEntity: (id, options) ->
      result = new Entities.MackayEducation {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'mackayEducation:entities', (options)->
    API.getMackayEducationEntities options
  Zeprj.reqres.setHandler 'mackayEducation:entity', (id, options)->
    API.getMackayEducationEntity id, options
