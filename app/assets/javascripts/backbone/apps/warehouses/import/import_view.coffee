Zeprj.module "WarehouseApp.Import", (Import, Zeprj, Backbone, Marionette, $, _) ->
  Import.itemView = Marionette.ItemView.extend()

  Import.collectionView = Marionette.CollectionView.extend
    itemView: Import.itemView

  Import.productSummaryItemView = Marionette.ItemView.extend
    template: ''

  Import.productSummaryCollectionView = Marionette.CollectionView.extend
    itemView: Import.productSummaryItemView

