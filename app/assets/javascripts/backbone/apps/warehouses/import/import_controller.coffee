Zeprj.module "WarehouseApp.Import", (Import, Zeprj, Backbone, Marionette, $, _) ->
  Import.Controller =
    renderSky: ->
      Import.layout.mainPane.show new Import.temporaryProductsView()
      
      Import.layout.secondaryPane.show new Import.productSummariesView({
        collection: Zeprj.request 'productSummary:entities'
      })

  Import.addInitializer ->
    Import.layout = new Zeprj.DualVerticalLayout()