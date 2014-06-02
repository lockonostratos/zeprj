Zeprj.module "SaleApp.Skull", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.temporaryProductView = Marionette.ItemView.extend
    template: JST['templates/sale/skull/temporaryProduct']

  ThisApp.productSummaryView = Marionette.ItemView.extend
    template: JST['templates/sale/skull/productSummary']
    className: 'product-summary-tile'
    tagName: 'li'
    events:
      'click': -> Zeprj.log @model.get 'product_code'

  ThisApp.emptyTemporaryProductsView = Marionette.ItemView.extend
    template: JST['templates/sale/skull/emptyTemporaryProduct']

  ThisApp.emptyProductSummariesView = Marionette.ItemView.extend
    template: JST['templates/sale/skull/emptyProductSummaries']

  ThisApp.temporaryProductsView = Marionette.CollectionView.extend
    itemView: ThisApp.temporaryProductView
    emptyView: ThisApp.emptyTemporaryProductsView

  ThisApp.productSummariesView = Marionette.CollectionView.extend
    itemView: ThisApp.productSummaryView
    emptyView: ThisApp.emptyProductSummariesView
    tagName: 'ul'
    className: 'tile-container'