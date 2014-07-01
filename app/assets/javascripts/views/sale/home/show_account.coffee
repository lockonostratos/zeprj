Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  class ThisApp.ShowAccountView extends Marionette.ItemView
    template: JST['templates/sale/home/showAccount']
    className: 'item-tile'
    tagName: 'select'

    initialize: ->
      @listenTo @model, 'change', ->
        @render()
        @trigger 'show:model'








