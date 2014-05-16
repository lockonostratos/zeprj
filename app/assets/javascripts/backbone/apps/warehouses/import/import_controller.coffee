Zeprj.module "WarehouseApp.Import", (Import, Zeprj, Backbone, Marionette, $, _) ->
  Import.Controller =
    renderSky: ->
      Import.layout.rightPane.show new Import.productSummaryView()
      Import.layout.leftPane.show new Import.temporaryProductView()