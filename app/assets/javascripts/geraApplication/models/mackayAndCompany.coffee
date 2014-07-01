Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.MackayAndCompany = Backbone.Model.extend
    urlRoot: 'mackay_and_companies'

  Entities.MackayAndCompanies = Sky.Collection.extend
    url: 'mackay_and_companies'
    model: Entities.MackayAndCompany

  API =
    getMackayAndCompanyEntities: (options)->
      result = new Entities.MackayAndCompanies()
      result.fetch options
      result
    getMackayAndCompanyEntity: (id, options) ->
      result = new Entities.MackayAndCompany {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'mackayAndCompany:entities', (options)->
    API.getMackayAndCompanyEntities options
  Zeprj.reqres.setHandler 'mackayAndCompany:entity', (id, options)->
    API.getMackayAndCompanyEntity id, options
