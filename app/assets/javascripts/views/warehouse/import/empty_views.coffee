Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.EmptyTemporaryProductsView extends Marionette.ItemView
    template: JST['templates/warehouse/import/emptyTemporaryProduct']
    className: 'empty-view import-temporaries'

  class ThisApp.EmptyProductSummariesView extends Marionette.ItemView
    template: JST['templates/warehouse/import/emptyProductSummaries']
    className: 'empty-view import-summaries'