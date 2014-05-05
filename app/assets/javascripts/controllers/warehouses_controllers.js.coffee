#Zeprj.WarehousesHomeController = Ember.ArrayController.extend()

Zeprj.WarehousesProductSummariesController = Ember.ArrayController.extend
  needs: ['application']
  merchantAccount: Ember.computed.alias('controllers.application.merchantAccount')
  product: (-> @store.createRecord('productSummary', {product_code: 'Code!', name: 'Name!'})).property()
  modelType: Zeprj.ProductSummary
  skullSingle: false

  productCodePlaceholder: 'nhap ma san pham'
  productNamePlaceholder: 'nhap ten san pham'

  editProductCode: true
  editName: false
  actions:
    createProduct: ->
      controller = @
      @get('product').set('warehouse_id', @get('merchantAccount.current_warehouse_id'))
    toggleEdit: (property)-> @toggleProperty(property)
    debuger: -> console.log @.get('product.product_code')

Zeprj.WarehousesImportController = Ember.ObjectController.extend()