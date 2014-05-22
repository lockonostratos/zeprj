Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.homeView

  ThisApp.addInitializer ->
    ThisApp.Caption = 'NHẬP SKULL'
    ThisApp.homeView = new ThisApp.HomeView()