Zeprj.module "WarehouseApp.Import", (Import, Zeprj, Backbone, Marionette, $, _) ->
  Import.temporaryProductView = Marionette.ItemView.extend
    template: JST['backbone/templates/warehouse/import/temporaryProduct']

  Import.productSummaryView = Marionette.ItemView.extend
    template: JST['backbone/templates/warehouse/import/productSummary']

  Import.tempProductsView = Marionette.CollectionView.extend
    itemView: Import.itemView

  Import.productSummariesView = Marionette.CollectionView.extend
    itemView: Import.productSummaryItemView

  Import.addInitializer ->
    Import.layout = new Zeprj.DualHorizontalLayout()


