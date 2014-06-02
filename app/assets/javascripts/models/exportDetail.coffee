Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.ExportDetail = Backbone.Model.extend
    urlRoot: 'export_details'

  Entities.ExportDetails = Sky.Collection.extend
    url: 'export_details'
    model: Entities.ExportDetail

  API =
    getExportDetailEntities: (options)->
      result = new Entities.ExportDetails()
      result.fetch options
      result
    getExportDetailEntity: (id) ->
      result = new Entities.ExportDetail {id: id}
      result.fetch()
      result

  Zeprj.reqres.setHandler 'exportDetail:entities', (options)->
    API.getExportDetailEntities options
  Zeprj.reqres.setHandler 'exportDetail:entity', (id)->
    API.getExportDetailEntity id
