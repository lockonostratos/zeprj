Zeprj.module "WarehouseApp", (WarehouseApp, Zeprj, Backbone, Marionette, $, _) ->
  WarehouseApp.Router = Marionette.AppRouter.extend
    appRoutes:
      'warehouse': 'warehouseHome'

  API =
    warehouseHome: ->
      Zeprj.navigate('warehouseHome')
      WarehouseApp.Controller.showHome()

  Zeprj.on 'navigate:warehouse', -> API.warehouseHome()
  Zeprj.on 'navigate:warehouseHome', -> API.warehouseHome()

  Zeprj.addInitializer -> new WarehouseApp.Router {controller: API}
