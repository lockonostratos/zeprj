Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.EmptyOrderDetailView = Backbone.Marionette.ItemView.extend
    template: JST['templates/sale/home/emptyOrderDetail']