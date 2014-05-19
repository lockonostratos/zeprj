Zeprj.module "WarehouseApp.Import", (Import, Zeprj, Backbone, Marionette, $, _) ->
  Import.temporaryProductView = Marionette.ItemView.extend
    template: JST['backbone/templates/warehouse/import/temporaryProduct']

  Import.productSummaryView = Marionette.ItemView.extend
    template: JST['backbone/templates/warehouse/import/productSummary']
    className: 'product-summary-tile'
    tagName: 'li'
    events:
      'click': -> Zeprj.log @model.attributes.product_code

  Import.emptyTemporaryProductsView = Marionette.ItemView.extend
    template: JST['backbone/templates/warehouse/import/emptyTemporaryProduct']

  Import.emptyProductSummariesView = Marionette.ItemView.extend
    template: JST['backbone/templates/warehouse/import/emptyProductSummaries']

  Import.temporaryProductsView = Marionette.CollectionView.extend
    itemView: Import.temporaryProductView
    emptyView: Import.emptyTemporaryProductsView

  Import.productSummariesView = Marionette.CollectionView.extend
    itemView: Import.productSummaryView
    emptyView: Import.emptyProductSummariesView
    tagName: 'ul'
    className: 'tile-container'

  Import.View = Marionette.ItemView.extend
