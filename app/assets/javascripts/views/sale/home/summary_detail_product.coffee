Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  ThisApp.SummaryDetailProductView = Backbone.Marionette.ItemView.extend
    template: JST['templates/sale/home/summaryDetailProduct']
    className: 'item-tile'
    initialize:->
      @listenTo @model, 'change', -> @render()

    ui:
      Voucher:"#Voucher"
      TotalAllPrice:"#Total-All-Price"
      TotalAllPriceFinal:"#Total-All-Price-Final"
      Change:"#Change"
      DiscountCash:"#Discount-Cash"
      Imported:"#Imported"
      Discount:"#Discount"
    onshow: ->

    events:
      'click input[type=button]': ->
        model = new Zeprj.Entities.showSale
        model = @model
        model.save()



    sumarryOrderDetail: (SaleQuality, Discount, DiscountCash, PriceAll, PriceAllFinal) ->
      @model.add {
        product_code: model.get 'product_code'
        product_name: model.get 'name'
        quality: SaleQuality
        price: model.get 'price'

        discount_cash: DiscountCash
        discount_percent: Discount
        total_amount: PriceAll
        total_amount_disount: PriceAllFinal
      }


