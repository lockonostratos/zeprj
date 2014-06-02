Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.EmptyTemporaryProductsView extends Marionette.ItemView
    template: JST['templates/warehouse/import/emptyTemporaryProduct']

  class ThisApp.EmptyProductSummariesView extends Marionette.ItemView
    template: JST['templates/warehouse/import/emptyProductSummaries']