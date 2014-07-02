Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.HomeSaleView = Backbone.Marionette.ItemView.extend
    template: JST['templates/sale/home/showSale']
    className: 'content'
    ui:
      ViewTop: '#third-top'
      ViewCenter: '#third-center'
      ViewBottom: '#third-bottom'
      UserAccount: '#user-account-id'
      CustomerAccount: '#customer-account-id'
    initialize: ->
      @listenTo @model, 'change', -> @render

    onShow:->
      if !ThisApp.addProductView
        ThisApp.addProductView = new ThisApp.AddProductView
          model: @model.get 'merchant_account'
      @ui.ViewTop.html(ThisApp.addProductView.render().$el)
      if !ThisApp.showAccountView
        ThisApp.showAccountView = new ThisApp.ShowAccountView
         model: @model.get 'merchant_account'
      @ui.UserAccount.html(ThisApp.showAccountView.render().$el)
      if !ThisApp.showCustomerView
        ThisApp.showCustomerView = new ThisApp.ShowCustomerView
          model: @model.get 'merchant_customer'
      @ui.CustomerAccount.html(ThisApp.showCustomerView.render().$el)
      if !ThisApp.detailProductView
        ThisApp.detailProductView = new ThisApp.DetailProductsView
          collection: new Backbone.Collection()
      @ui.ViewCenter.html(ThisApp.detailProductView.render().$el)
      ThisApp.addProductView.on 'create:product:model', (model, SaleQuality, Discount, DiscountCash, PriceAll, PriceAllFinal)->
        ThisApp.detailProductView.createOrderDetail model, SaleQuality, Discount, DiscountCash, PriceAll, PriceAllFinal
      ThisApp.summaryDetailProductView = new ThisApp.SummaryDetailProductView()
      @ui.ViewBottom.html(ThisApp.summaryDetailProductView.render().$el)






