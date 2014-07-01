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
#        model: Zeprj.request 'productSummary:entity',1
      ThisApp.layout.mainPane.show ThisApp.addProductView
    handleAddProductEvent:->

    renderDetailProducts:->
      ThisApp.detailProductView = new ThisApp.DetailProductsView
        collection: new Backbone.Collection()
      ThisApp.layout.secondaryPane.show ThisApp.detailProductView

    handleDetailProductsEvent:->
      ThisApp.addProductView.on 'create:product:model', (model, SaleQuality, Discount, DiscountCash, PriceAll, PriceAllFinal)->
        ThisApp.detailProductView.createOrderDetail model, SaleQuality, Discount, DiscountCash, PriceAll, PriceAllFinal
        collection= ThisApp.detailProductView.collection
        #        collection.
        ThisApp.summaryDetailProductView.sumarryOrderDetail
    renderSummaryDetailProducts:->
      ThisApp.summaryDetailProductView = new ThisApp.SummaryDetailProductView
        model: new Backbone.Model()
      ThisApp.layout.thirdPane.show ThisApp.summaryDetailProductView