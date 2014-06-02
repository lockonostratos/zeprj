Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Import = Backbone.Model.extend
    urlRoot: 'imports'

  Entities.Imports = Sky.Collection.extend
    url: 'imports'
    model: Entities.Import

  API =
    getImportEntities: (options)->
      result = new Entities.Imports()
      result.fetch options
      result
    getImportEntity: (id) ->
      result = new Entities.Import {id: id}
      result.fetch()
      result

  Zeprj.reqres.setHandler 'import:entities', (options)->
    API.getImportEntities options
  Zeprj.reqres.setHandler 'import:entity', (id)->
    API.getImportEntity id
