Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.ReturnDetail = Backbone.Model.extend
    urlRoot: 'return_details'

  Entities.ReturnDetails = Sky.Collection.extend
    url: 'return_details'
    model: Entities.ReturnDetail

  API =
    getReturnDetailEntities: (options)->
      result = new Entities.ReturnDetails()
      result.fetch(options)
      result

    getReturnDetailEntity: (id) ->
      result = new Entities.ReturnDetail({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'returnDetail:entities', (options)->
    API.getReturnDetailEntities(options)

  Zeprj.reqres.setHandler 'returnDetail:entity', (id)->
    API.getReturnDetailEntity(id)