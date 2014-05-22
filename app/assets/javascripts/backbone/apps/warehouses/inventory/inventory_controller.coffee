Zeprj.module "WarehouseApp.Inventory", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout


  ThisApp.addInitializer ->
    ThisApp.Caption = 'KIEM KHO'
    ThisApp.layout = new Zeprj.DummerLayout()