Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'BÁN HÀNG'
    ThisApp.layout = new Zeprj.ThirdVerticalLayout()


  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
      @renderAddProduct()
      @handleAddProductEvent()
      @renderDetailProducts()
      @handleDetailProductsEvent()
      @renderSummaryDetailProducts()

    renderAddProduct:->
      ThisApp.addProductView = new ThisApp.AddProductView()
      ThisApp.layout.mainPane.show ThisApp.addProductView
    handleAddProductEvent:->
#      ThisApp.detailProductView.on 'create:import', (model) ->
#        quality = accounting.parse(@ui.importQuality.inputmask('unmaskedvalue'))
#        price = accounting.parse(@ui.importPrice.inputmask('unmaskedvalue'))
#        ThisApp.detailProductView.createOrderDetail model, quality, price

    renderDetailProducts:->
      ThisApp.detailProductView = new ThisApp.DetailProductsView()
      ThisApp.layout.secondaryPane.show ThisApp.detailProductView

    handleDetailProductsEvent:->
      ThisApp.addProductView.on 'create:product:model', (model, SaleQuality, Discount, DiscountCash, PriceAll, PriceAllFinal)->
        ThisApp.detailProductView.createOrderDetail model, SaleQuality, Discount, DiscountCash, PriceAll, PriceAllFinal


    renderSummaryDetailProducts:->
      ThisApp.summaryDetailProductView = new ThisApp.SummaryDetailProductView()
      ThisApp.layout.thirdPane.show ThisApp.summaryDetailProductView