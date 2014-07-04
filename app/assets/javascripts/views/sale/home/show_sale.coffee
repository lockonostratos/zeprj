Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.HomeSaleLayout = Backbone.Marionette.Layout.extend
    template: JST['templates/sale/home/showSale']
    className: 'content'
    regions: {
      mainPane: '#third-top'
      secondaryPane: '#third-center'
      thirdPane: '#third-bottom'
    }
    ui:
      ViewTop: '#third-top'
      ViewCenter: '#third-center'
      ViewBottom: '#third-bottom'
      UserAccount: '#user-account-id'
      CustomerAccount: '#customer-account-id'
    initialize: ->
      ThisApp.Model = @model
      @listenTo @model, 'change', ->
        @render



    onShow:->
      #Load mainPane
      ThisApp.addProductView = new ThisApp.AddProductView
        model: @model
      @mainPane.show ThisApp.addProductView

      #Load @secondaryPane
      ThisApp.rowDetailView = new ThisApp.ProductSaleView
        model: new Backbone.Model
      ThisApp.ProductsSaleView = new Darius.Grid
        columns: [
          caption: "MÃ SẢN PHẨM"
          key: 'product_code'
          format: ''
        ,
          caption: 'TÊN SẢN PHẨM'
          key: 'name'
        ,
          caption: 'S.L'
          key: 'quality'
        ,
          caption: 'GIÁ'
          key: 'price'
        ,
          caption: 'GIẢM GIÁ %'
          key: 'discount_percent'
        ,
          caption: 'GIẢM GIÁ TM'
          key: 'discount_cash'
        ,
          caption: 'TỔNG TIỀN'
          key: 'total_amount_disount'
        ]
        collection: ThisApp.Model.get 'product_summary'
        rowDetail: ThisApp.rowDetailView
      @secondaryPane.show ThisApp.ProductsSaleView

      #Load @thirdPane
      ThisApp.summaryDetailProductView = new ThisApp.SummaryDetailProductView
        model: @model
      @thirdPane.show ThisApp.summaryDetailProductView

      #Load danh sách Nhân Viên Bán Hàng
      if !ThisApp.ModelAccountView
        ThisApp.ModelAccountView = new ThisApp.ShowAccountView
         model: @model.get 'merchant_account'
      @ui.UserAccount.html(ThisApp.ModelAccountView.render().$el)#
      #Load danh sách Khách Hàng
      if !ThisApp.ModelCustomerView
        ThisApp.ModelCustomerView = new ThisApp.ShowCustomerView
          model: @model.get 'merchant_customer'
      @ui.CustomerAccount.html(ThisApp.ModelCustomerView.render().$el)

      #Bắt Event add product vào grid view
      ThisApp.addProductView.on 'create:product:model', (model, SaleQuality, Discount, DiscountCash, PriceAll, PriceAllFinal)->
        product_model = new Backbone.Model
          product_code: model.get 'product_code'
          name: model.get 'name'
          quality: SaleQuality
          price: model.get 'price'
          discount_cash: Discount
          discount_percent: DiscountCash
          total_amount: PriceAll
          total_amount_disount: PriceAllFinal
        product_collection = new Backbone.Collection
        product_collection = ThisApp.Model.get 'product_summary'
        product_collection.add(product_model)
        ThisApp.Model.set(product_summary:product_collection)
        ThisApp.ProductsSaleView.collection.add(product_model)













