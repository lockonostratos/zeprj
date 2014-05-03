#Zeprj.WarehousesHomeController = Ember.ArrayController.extend()

Zeprj.WarehousesProductSummariesController = Ember.ArrayController.extend
  needs: ['application']
  merchantAccount: Ember.computed.alias('controllers.application.merchantAccount')
  product: (-> @store.createRecord('productSummary')).property()
  skullSingle: false

  productCodePlaceholder: 'nhap ma san pham'
  productNamePlaceholder: 'nhap ten san pham'

  editProductCode: false
  editName: false
  actions:
    createProduct: ->
      controller = @
      @get('product').set('warehouse_id', @get('merchantAccount.current_warehouse_id'))
    debug: ->
      console.log(@get('product.product_code'))
    toggleEdit: -> @toggleProperty('editProductCode')


Zeprj.WarehousesImportController = Ember.ObjectController.extend()