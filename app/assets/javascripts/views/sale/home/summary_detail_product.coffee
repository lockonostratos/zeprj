Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  ThisApp.SummaryDetailProductView = Backbone.Marionette.ItemView.extend
    template: JST['templates/sale/home/summaryDetailProduct']
    className: 'item-tile'
#    initialize:->
#      @listenTo @model, 'change', -> @render()

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
      'click #checkbox1': 'showVoucher'

    showVoucher:->

      if $('#checkbox1').attr('checked') == 'checked'
        Zeprj.log $('#checkbox1').attr('checked')
        $('#id_voucher').style.display = ''
      else
        $('#id_voucher').display

    sumaryOrderDetail:  ->

#      @ui.TotalAllPrice.val(parseFloat(@ui.TotalAllPrice.val())+parseFloat(PriceAll))
#      @ui.Discount.val(parseFloat(@ui.Discount.val())+parseFloat(Discount))
#      @ui.TotalAllPriceFinal.val(parseFloat(@ui.TotalAllPriceFinal.val())+parseFloat(PriceAllFinal))
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


