Zeprj.module "WarehouseApp.Transport", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'CHUYỂN KHO'
    ThisApp.layout = new Zeprj.DummerLayout()

  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout