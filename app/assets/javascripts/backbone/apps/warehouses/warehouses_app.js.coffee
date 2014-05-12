Zeprj.module "WarehouseApp", (WarehouseApp, Zeprj, Backbone, Marionette, $, _) ->
  WarehouseApp.Router = Marionette.AppRouter.extend
    appRoutes:
      'warehouse': 'warehouseHome'

    API =
      showWarehouseIndex: ->
        Zeprj.navigate('warehouseIndex')
        WarehouseApp.Import.Controller.showContent()