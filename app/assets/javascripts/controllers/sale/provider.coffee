Zeprj.module "SaleApp.Provider", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'NHÀ SẢN XUẤT'
    ThisApp.layout = new Zeprj.DummerLayout()

  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout