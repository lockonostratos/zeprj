Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  class ThisApp.AddProductView extends Marionette.ItemView
    template: JST['templates/sale/home/addProduct']
    className: 'item-tile'
    ui:
      IdBill: '#bill-id'
      UserAccount: '#user-account-id'
      CustomeAccount: '#customer-account-id'
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
    events:
      'click #search-product': 'searchProduct'
      'click #confirm-product': (e) ->
        @trigger 'create:product:model', @model,
          @ui.SaleQuality.val(),
          @ui.Discount.val(),
          @ui.DiscountCash.val(),
          @ui.PriceAll.val(),
          @ui.PriceAllFinal.val()

    searchProduct: ->
      @model = Zeprj.request 'productSummary:entity',1
      @listenTo @model, 'change', ->
        @render()
        @ui.IdBill.val('12345')
        @ui.UserAccount.val('Sang')
        @ui.CustomeAccount.val('Ky')
        @ui.SaleQuality.val(10)
        @ui.Discount.val(0)
        @ui.DiscountCash.val(0)
        @ui.PriceAll.val(200000)
        @ui.PriceAllFinal.val(200000)
















