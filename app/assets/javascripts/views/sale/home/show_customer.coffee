Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  class ThisApp.ShowCustomerView extends Marionette.ItemView
    template: JST['templates/sale/home/showCustomer']
    className: 'item-tile'
    tagName: 'select'

    initialize: ->
      @listenTo @model, 'change', -> @render()






