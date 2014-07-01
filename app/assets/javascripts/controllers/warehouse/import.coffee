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
      ThisApp.layout.secondaryPane.show ThisApp.temporaryProductsView

    handleTemporaryProductsEvent: ->
      ThisApp.temporaryProductsView.on 'edit:model:property', (e, model, attribute) ->
        ThisApp.temporaryEditWrapper.startEdit $('#sky-editor'), model, attribute


      #SAU KHI XÓA IMPORT, THÊM VÀO PRODUCT_SUMMARY SẢN PHẨM TƯƠNG ĐƯƠNG.
      ThisApp.temporaryProductsView.on 'destroy:model:success', (model, message) ->
        newProductSummary = Zeprj.request 'productSummary:entity', (model.get 'product_summary_id')
        ThisApp.productSummariesView.collection.add newProductSummary

      #SAU KHI TẠO IMPORT THÀNH CÔNG, XÓA PRODUCT_SUMMARY ĐÃ IMPORT TỪ VIEW.
      ThisApp.temporaryProductsView.on 'item:create:success', (model) ->
        collection = ThisApp.productSummariesView.collection
        deletingModel = collection.where { id: model.get 'product_summary_id' }
        ThisApp.productSummariesView.collection.remove deletingModel if deletingModel

    renderProductSummaries: ->
      ThisApp.productSummariesView = new ThisApp.ProductSummariesView
        collection: Zeprj.request 'productSummary:entities', {action: 'import_availables'}
      ThisApp.layout.mainPane.show ThisApp.productSummariesView

    handleProductSummariesEvent: ->
      ThisApp.productSummariesView.on 'edit:model:property', (e, model, attribute) ->
        ThisApp.productSummaryEditOptions.startEdit $('#sky-editor'), model, attribute

      ThisApp.productSummariesView.on 'create:import', (model) ->
        quality = accounting.parse(@ui.importQuality.inputmask('unmaskedvalue'))
        price = accounting.parse(@ui.importPrice.inputmask('unmaskedvalue'))
        ThisApp.temporaryProductsView.createImport model, quality, price

      ThisApp.productSummariesView.on 'sync:edit', (model) ->
        model.save({
          merchant_account_id: Zeprj.currentAccount.get 'id'
          warehouse_id: Zeprj.currentMerchantAccount.get 'current_warehouse_id'
          product_code: model.get 'product_code'
          name: model.get 'name'
          quality: model.get 'quality'
          price: model.get 'price'
        }, {
          success: -> Zeprj.log 'success'
          error: -> Zeprj.log 'error'
        })