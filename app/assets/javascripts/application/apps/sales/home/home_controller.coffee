#Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
#  ThisApp.Controller =
#    renderInto: (region) ->
#      region.show ThisApp.homeView
#
#  ThisApp.addInitializer ->
#    ThisApp.Caption = 'BÁN HÀNG'
#    ThisApp.homeView = new ThisApp.HomeView()