Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.ProductSummary = Backbone.Model.extend
    urlRoot: 'product_summaries'

  Entities.ProductSummaries = Sky.Collection.extend
    url: 'product_summaries'
    model: Entities.ProductSummary

  API =
    getProductSummaryEntities: ->
      result = new Entities.ProductSummaries()
      #result.fetch()
      result

    getProductSummaryEntity: (id) ->
      result = new Entities.ProductSummary({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'productSummary:entities', ->
    API.getProductSummaryEntities()

  Zeprj.reqres.setHandler 'productSummary:entity', (id)->
    API.getProductSummaryEntity(id)