#Zeprj.WarehousesHomeController = Ember.ArrayController.extend()

Zeprj.WarehousesProductSummariesController = Ember.ArrayController.extend
  needs: ['application']
  merchantAccount: Ember.computed.alias('controllers.application.merchantAccount')
  product: (-> @store.createRecord('product')).property()
  skullSingle: false
  actions:
    createProduct: ->
      controller = @
      @get('product').set('warehouse_id', @get('merchantAccount.current_warehouse_id'))
    debug: ->
      console.log(@get('product.product_code'))


Zeprj.WarehousesImportController = Ember.ObjectController.extend()