Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.ProductSaleView extends Marionette.ItemView
    template: JST['templates/warehouse/import/productSummary']
    className: 'item-tile'
    tagName: 'li'
    initialize: ->
      @listenTo @model, 'change', -> @render()



