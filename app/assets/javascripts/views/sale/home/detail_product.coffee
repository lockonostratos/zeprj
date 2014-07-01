Zeprj.module "SaleApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  class ThisApp.DetailProductView extends Marionette.ItemView
    template: JST['templates/sale/home/detailProduct']
    className: 'item-tile'
    tagName: 'tr'
    initialize: ->
      @listenTo @model, 'change', -> @render()

  # COLLECTION ---------------------------------------------------------------------------------------------------->
  class ThisApp.DetailProductsView extends Marionette.CompositeView
    template: JST['templates/sale/home/detailProducts']
    className: 'product-summary-wrapper'
    itemView: ThisApp.DetailProductView
    itemViewContainer: ".tile-container"

    createOrderDetail: (model, SaleQuality, Discount, DiscountCash, PriceAll, PriceAllFinal) ->
      @collection.add {
        product_code: model.get 'product_code'
        product_name: model.get 'name'
        quality: SaleQuality
        price: model.get 'price'

        discount_cash: Discount
        discount_percent: DiscountCash
        total_amount: PriceAll
        total_amount_disount: PriceAllFinal
      }


