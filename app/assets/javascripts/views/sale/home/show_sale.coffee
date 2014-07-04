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
      ThisApp.show = @model
      @listenTo @model, 'change', ->
        @render



    onShow:->
      #Load mainPane
      ThisApp.addProductView = new ThisApp.AddProductView
        model: ThisApp.show
      @mainPane.show ThisApp.addProductView
      #Load @secondaryPane
      ThisApp.rowDetailView = new ThisApp.ProductSaleView
        model: new Backbone.Model
      ThisApp.ProductsSaleView = new Darius.Grid
        columns: [
          caption: "MÃ"
          key: 'product_code'
          width: '80px'
          format: ''
        ,
          caption: 'TÊN'
          key: 'name'
        ,
          caption: 'S.LƯỢNG'
          key: 'quality'
          width: '50px'
        ,
          caption: 'GIÁ'
          key: 'price'
          width: '150px'
        ]
        collection: new Backbone.Collection
        rowDetail: ThisApp.rowDetailView
      @secondaryPane.show ThisApp.ProductsSaleView
      #Load @thirdPane
      ThisApp.summaryDetailProductView = new ThisApp.SummaryDetailProductView()
      @thirdPane.show ThisApp.summaryDetailProductView


      #Load danh sách Nhân Viên Bán Hàng
      if !ThisApp.showAccountView
        ThisApp.showAccountView = new ThisApp.ShowAccountView
         model: @model.get 'merchant_account'
      @ui.UserAccount.html(ThisApp.showAccountView.render().$el)#
      #Load danh sách Khách Hàng
      if !ThisApp.showCustomerView
        ThisApp.showCustomerView = new ThisApp.ShowCustomerView
          model: @model.get 'merchant_customer'
      @ui.CustomerAccount.html(ThisApp.showCustomerView.render().$el)


      #Bắt Event add product
      ThisApp.addProductView.on 'create:product:model', (model, SaleQuality, Discount, DiscountCash, PriceAll, PriceAllFinal)->
        product_model = new Backbone.Model
          product_code: model.get 'product_code'
          name: model.get 'name'
          quality: SaleQuality
          price: model.get 'price'

#          discount_cash: Discount
#          discount_percent: DiscountCash
#          total_amount: PriceAll
#          total_amount_disount: PriceAllFinal
        product_collection = new Backbone.Collection
        product_collection = ThisApp.show.get 'product_summary'
        product_collection.add(product_model)
        ThisApp.show.set(product_summary:product_collection)
#        ThisApp.ProductsSaleView.collection = ThisApp.show.get 'product_sumarry_detail'
        ThisApp.ProductsSaleView.collection.add(product_model)
        Zeprj.log ThisApp.show.get 'product_summary'
        Zeprj.log ThisApp.ProductsSaleView.collection












