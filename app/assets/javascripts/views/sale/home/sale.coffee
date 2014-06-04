Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  ThisApp.OrderDetailView = Backbone.Marionette.ItemView.extend
    template: JST['templates/sale/home/orderDetail']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click .up.link': (e) -> @trigger 'up:link:click', @model


  # COLLECTION ---------------------------------------------------------------------------------------------------->
  ThisApp.SalesView = Backbone.Marionette.CompositeView.extend
    template: JST['templates/sale/home/sales']
    className: 'content row'
    itemView: ThisApp.OrderDetailView
    itemViewContainer: '.order-details-container'
    emptyView: ThisApp.EmptyOrderDetailView
    ui:
      summaryRegion: '.summary.row'

    initialize: ->
      @on 'itemview:up:link:click', (e, model) -> @trigger 'up:link:click', model
#      @summaryModel = ->
#        productCount: 1

    onShow: ->
#      ko.applyBindings(new @summaryModel, @.ui.summaryRegion)


