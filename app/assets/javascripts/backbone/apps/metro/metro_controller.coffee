Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Controller =
    showContent: ->
      Zeprj.mainRegion.show(new MetroApp.homeView)
    showWarehouse: ->
      Zeprj.mainRegion.show(Zeprj.WarehouseApp.layout)
