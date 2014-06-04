Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.SaleSummaryView = Backbone.Marionette.ItemView.extend
    template: JST['templates/sale/home/saleSummary']
    className: 'right'
