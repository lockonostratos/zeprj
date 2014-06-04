Zeprj.module "SaleApp.Skull", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'SKULL'
    ThisApp.layout = new Zeprj.DummerLayout()

  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout