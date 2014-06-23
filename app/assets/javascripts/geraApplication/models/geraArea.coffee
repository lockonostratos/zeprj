Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.GeraArea = Backbone.Model.extend
    urlRoot: 'gera_areas'

  Entities.GeraAreas = Sky.Collection.extend
    url: 'gera_areas'
    model: Entities.GeraArea

  API =
    getGeraAreaEntities: (options)->
      result = new Entities.GeraAreas()
      result.fetch options
      result
    getGeraAreaEntity: (id, options) ->
      result = new Entities.GeraArea {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'geraArea:entities', (options)->
    API.getGeraAreaEntities options
  Zeprj.reqres.setHandler 'geraArea:entity', (id, options)->
    API.getGeraAreaEntity id, options
