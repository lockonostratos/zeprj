Zeprj.module "WarehousesApp.Import", (Import, Zeprj, Backbone, Marionette, $, _) ->
    Import.ItemView = Marionette.ItemView.extend()
    Import.CollectionView = Marionette.CollectionView.extend
      itemView: Import.ItemView

    Import.ProductSummaryItemView = Marionette.ItemView.extend()
    Import.ProductSummaryCollectionView = Marionette.CollectionView.extend
      itemView: Import.ProductSummaryItemView

