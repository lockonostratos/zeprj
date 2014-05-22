Zeprj.module "WarehouseApp", (WarehouseApp, Zeprj, Backbone, Marionette, $, _) ->
  WarehouseApp.Router = Marionette.AppRouter.extend
    appRoutes:
      'warehouse': 'warehouseHome'

  API =
    warehouseHome: ->
      WarehouseApp.Controller.renderInto Zeprj.mainRegion
    warehouseImport: ->
      WarehouseApp.Controller.renderInto Zeprj.mainRegion, 'Import'
    warehouseInventory: ->
      WarehouseApp.Controller.renderInto Zeprj.mainRegion, 'Inventory'

  Zeprj.on 'navigate:warehouse', -> API.warehouseHome()
  Zeprj.on 'navigate:warehouseHome', -> API.warehouseHome()
  Zeprj.on 'navigate:warehouse/Import', -> API.warehouseImport()
  Zeprj.on 'navigate:warehouse/Inventory', -> API.warehouseInventory()

  Zeprj.addInitializer -> new WarehouseApp.Router {controller: API}
