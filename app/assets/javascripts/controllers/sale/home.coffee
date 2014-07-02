Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'BÁN HÀNG'
    ThisApp.layout = new ThisApp.HomeSaleView
      model: Zeprj.request 'show:sale'

  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
