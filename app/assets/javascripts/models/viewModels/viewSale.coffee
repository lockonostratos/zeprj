Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.showSale = Backbone.Model.extend
    urlRoot: 'orders'
    defaults: {
      merchant_account: Zeprj.request 'account:entities'
      merchant_customer: Zeprj.request 'customer:entities'
      merchant_customer_new: []
      bill_code: '120414-001001'
      bill_print_show: ''
      product_search: [

      ]
      product_select: [

      ]
      product_summarry: [

      ]
      product_sumarry_detail: [

      ]
      delivery: ''
      payment_methods: ''
    }

  API =
    getShowSaleEntity: ->
      result = new Entities.showSale()
      result.fetch()
      result

  Zeprj.reqres.setHandler 'show:sale', ->
    API.getShowSaleEntity()