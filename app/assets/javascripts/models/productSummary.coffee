Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.ProductSummary = Backbone.Model.extend
    urlRoot: 'product_summaries'
    defaults:
      quality: 0

  Entities.ProductSummaries = Sky.Collection.extend
    url: 'product_summaries'
    model: Entities.ProductSummary

  API =
    getProductSummaryEntities: (options)->
      result = new Entities.ProductSummaries()
      result.fetch(options)
      result

    getProductSummaryEntity: (id) ->
      result = new Entities.ProductSummary({id: id})
      Zeprj.log id
      result.fetch()
      result

  Zeprj.reqres.setHandler 'productSummary:entities', (options)->
    API.getProductSummaryEntities(options)

  Zeprj.reqres.setHandler 'productSummary:entity', (id)->
    API.getProductSummaryEntity(id)