Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'NHẬP KHO'
    ThisApp.layout = new Zeprj.DualVerticalLayout()

    ThisApp.productSummaryEditOptions = new Sky.Editor.Wrapper
      product_code: new Sky.Editor.RenderOption true, 'barcode'
      name: new Sky.Editor.RenderOption true, 'title'
      quality: new Sky.Editor.RenderOption false
      price: new Sky.Editor.RenderOption true, 'vnd'

    ThisApp.temporaryEditWrapper = new Sky.Editor.Wrapper
      import_quality: new Sky.Editor.RenderOption true, 'quality'
      import_price: new Sky.Editor.RenderOption true, 'vnd'

  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
      @renderTemporaryProducts()
      @renderProductSummaries()
      @handleTemporaryProductsEvent()
      @handleProductSummariesEvent()


    renderTemporaryProducts: ->
      ThisApp.temporaryProductsView = new ThisApp.TemporaryProductsView
        collection: Zeprj.request 'tempProduct:entities'
      ThisApp.layout.mainPane.show ThisApp.temporaryProductsView

    handleTemporaryProductsEvent: ->
      ThisApp.temporaryProductsView.on 'edit:click', (e, model, attribute) ->
        ThisApp.temporaryEditWrapper.startEdit $('#sky-editor'), model, attribute

      ThisApp.temporaryProductsView.on 'item:delete', (e, model) ->
        model.destroy
          wait: true
          success: (model) ->
  #            Zeprj.log model
  #            Zeprj.log 'xx'
  #            newModel = Zeprj.request 'productSummary:entity', model.get 'product_summary_id'
  #            ThisApp.productSummariesView.addItemView newModel, ThisApp.ProductSummaryView, 0

      ThisApp.temporaryProductsView.on 'item:create', (model) ->
        collection = ThisApp.productSummariesView.collection
        deletingModel = collection.where { product_code: model.get 'product_code' }
        ThisApp.productSummariesView.collection.remove deletingModel if deletingModel

    renderProductSummaries: ->
      ThisApp.productSummariesView = new ThisApp.ProductSummariesView
        collection: Zeprj.request 'productSummary:entities', {action: 'import_availables'}
      ThisApp.layout.secondaryPane.show ThisApp.productSummariesView

    handleProductSummariesEvent: ->
      ThisApp.productSummariesView.on 'edit:click', (e, model, attribute) ->
        ThisApp.productSummaryEditOptions.startEdit $('#sky-editor'), model, attribute

      ThisApp.productSummariesView.on 'import:click', (model) ->
        quality = accounting.parse(@ui.importQuality.inputmask('unmaskedvalue'))
        price = accounting.parse(@ui.importPrice.inputmask('unmaskedvalue'))
        ThisApp.temporaryProductsView.addImport model, quality, price

      ThisApp.productSummariesView.on 'item:save', (model) ->
        model.save({
          product_code: model.get 'product_code'
          skull_id: model.get 'skull_id'
          warehouse_id: Zeprj.currentMerchantAccount.get 'current_warehouse_id'
          merchant_account_id: Zeprj.currentMerchantAccount.get 'id'
          name: model.get 'name'
          quality: model.get 'quality'
          price: model.get 'price'
        }, {
          success: -> Zeprj.log 'success'
          error: -> Zeprj.log 'error'
        })

      ThisApp.productSummariesView.onClose = ->
        Zeprj.log 'Cloused!'

