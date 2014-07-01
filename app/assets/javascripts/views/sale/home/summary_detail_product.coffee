Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  ThisApp.SummaryDetailProductView = Backbone.Marionette.ItemView.extend
    template: JST['templates/sale/home/summaryDetailProduct']
    className: 'item-tile'



