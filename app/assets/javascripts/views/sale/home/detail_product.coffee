Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.ProductSaleView extends Marionette.ItemView
    template: JST['templates/sale/home/detailProduct']
    className: 'item-tile'
#    tagName: 'li'
    initialize: ->
      @listenTo @model, 'change', -> @render()

    events:
      'click span[editor]': (e) ->
        @trigger 'edit:model:property', @model, $(e.currentTarget).attr('editor')





