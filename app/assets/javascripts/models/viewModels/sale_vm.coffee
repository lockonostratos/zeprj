Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.billCode = Backbone.Model.extend
    url: '/orders/bill_code'

  API =
    getShowSaleEntity: ->
      result = new Entities.showSale()
      #      result.fetch()
      result
    getBillCodeEntity: ->
      result = new Entities.billCode()
      result.fetch({action: 'bill_code'})
      result

  Zeprj.reqres.setHandler 'show:sale', ->
    API.getShowSaleEntity()
  Zeprj.reqres.setHandler 'show:bill', ->
    API.getBillCodeEntity()

  Entities.showSale = Backbone.Model.extend
    urlRoot: 'orders'
    defaults: {
      merchant_account: Zeprj.request 'account:entities'
      merchant_customer: Zeprj.request 'customer:entities'
      merchant_customer_new: new Backbone.Model
      bill_code: Zeprj.request 'show:bill'
      bill_print_show: ''
      delivery: Zeprj.request 'show:bill'
      product_search: []
      product_select: new Backbone.Model
      product_summary: new Backbone.Collection
      product_summary_detail:{
        payment_methods: ''
      }

    }