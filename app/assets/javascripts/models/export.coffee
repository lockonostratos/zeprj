Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Export = Backbone.Model.extend
    urlRoot: 'exports'

  Entities.Exports = Sky.Collection.extend
    url: 'exports'
    model: Entities.Export

  API =
    getExportEntities: (options)->
      result = new Entities.Exports()
      result.fetch options
      result
    getExportEntity: (id) ->
      result = new Entities.Export {id: id}
      result.fetch()
      result

  Zeprj.reqres.setHandler 'export:entities', (options)->
    API.getExportEntities options
  Zeprj.reqres.setHandler 'export:entity', (id)->
    API.getExportEntity id
