Zeprj.module "WarehouseApp.Import", (Import, Zeprj, Backbone, Marionette, $, _) ->
  Import.Controller =
    renderInto: (region)->
      Import.layout = new Zeprj.DualVerticalLayout()

      region.show Import.layout
      Import.layout.mainPane.show new Import.temporaryProductsView()

      Import.layout.secondaryPane.show new Import.productSummariesView({
        collection: Zeprj.request 'productSummary:entities'
      })