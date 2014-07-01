Zeprj.module "CustomerApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.CustomerView extends Marionette.ItemView
    template: JST['templates/customer/home/geraCustomer']
    className: 'item-tile'
    tagName: 'li'
    ui:
      Name1: '#gera-name'
      Area1: '#gera-area'
    initialize: ->
    onShow: ->