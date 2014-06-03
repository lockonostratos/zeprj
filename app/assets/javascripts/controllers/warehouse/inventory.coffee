Zeprj.module "WarehouseApp.Inventory", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'KIỂM KHO'
    ThisApp.layout = new Zeprj.DummerLayout()

  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout