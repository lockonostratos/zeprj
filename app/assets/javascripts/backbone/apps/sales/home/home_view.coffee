Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.HomeView = Marionette.ItemView.extend
    template: JST['backbone/templates/sale/home/index']
    className: 'sale-container'