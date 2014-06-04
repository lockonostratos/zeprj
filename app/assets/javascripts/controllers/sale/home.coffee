Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'BÁN HÀNG'
    ThisApp.view = new ThisApp.SalesView
      collection: Zeprj.request 'productSummary:entities'


  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.view
      @handleOrderDetailsEvent()

    handleOrderDetailsEvent: ->
      ThisApp.view.on 'up:link:click', (model) ->
        Zeprj.log ThisApp.view.collection

      ThisApp.view.collection.on 'remove add reset create sync', -> @calculateSummary()

    calculateSummary: ->