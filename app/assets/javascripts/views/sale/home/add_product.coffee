Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  class ThisApp.AddProductView extends Marionette.ItemView
    template: JST['templates/sale/home/addProduct']
    className: 'row'
    ui:
      IdBill: '#bill-id'
      UserAccount: '#user-account-id'
      CustomerAccount: '#customer-account-id'
      ProductCode: '#product-code'
      Skull: '#skull-id'
      WarehouseQuality: '#warehouse-quality'
      SaleQuality: '#sale-quality'
      ProductName: '#product-name'
      Discount: '#discount'
      DiscountCash: '#discount-cash'
      Price: '#product-price'
      PriceAll: '#all-price'
      PriceAllFinal: '#all-price-final'

    initialize: ->
      @listenTo @model, 'change', ->
        @render()




    onShow: ->

#      if !ThisApp.showAccountView
#        ThisApp.showAccountView = new ThisApp.ShowAccountView
#          model: @model.get 'merchant_account'
#      @ui.UserAccount.html(ThisApp.showAccountView.render().$el)
#
#      if !ThisApp.showCustomerView
#        ThisApp.showCustomerView = new ThisApp.ShowCustomerView
#          model: @model.get 'merchant_customer'
#      @ui.CustomerAccount.html(ThisApp.showCustomerView.render().$el)

    events:
      'click #search-product': 'searchProduct'
      'click #confirm-product': (e) ->
        @trigger 'create:product:model', @model,
          @ui.SaleQuality.val(),
          @ui.Discount.val(),
          @ui.DiscountCash.val(),
          @ui.PriceAll.val(),
          @ui.PriceAllFinal.val()

      'keyup #sale-quality':->
        @ui.PriceAll.val(@model.get('price')*@ui.SaleQuality.val())
        @ui.PriceAllFinal.val(@ui.PriceAll.val()-@ui.Discount.val())
      'keyup #discount-cash':->
        @ui.Discount.val(@ui.PriceAll.val()*@ui.DiscountCash.val()/100)
        @ui.PriceAllFinal.val(@ui.PriceAll.val()-@ui.Discount.val())
      'keyup #discount':->
        @ui.DiscountCash.val(parseFloat(@ui.Discount.val()*100/@ui.PriceAll.val()).toFixed(2))
        @ui.PriceAllFinal.val(@ui.PriceAll.val()-@ui.Discount.val())

    searchProduct: ->
      @model = Zeprj.request 'productSummary:entity',1
      @listenTo @model, 'change', ->
        @render()
        @ui.IdBill.val('12345')
        @ui.UserAccount.val('Sang')
        @ui.CustomerAccount.val('Ky')
        @ui.SaleQuality.val(0)
        @ui.Discount.val(0)
        @ui.DiscountCash.val(0)
        @ui.PriceAll.val(0)
        @ui.PriceAllFinal.val(0)

















