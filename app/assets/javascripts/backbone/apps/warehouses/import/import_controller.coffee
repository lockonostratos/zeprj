Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout

      ThisApp.temporaryProductsView = new ThisApp.TemporaryProductsView
        collection: Zeprj.request 'tempProduct:entities'
      ThisApp.layout.mainPane.show ThisApp.temporaryProductsView

      ThisApp.productSummariesView = new ThisApp.ProductSummariesView
        collection: Zeprj.request 'productSummary:entities'#, {action: 'import_availables'}
      ThisApp.layout.secondaryPane.show ThisApp.productSummariesView

      #NEW IMPORTS -> TOP PANE
      ThisApp.temporaryProductsView.on 'edit:click', (e, model, attribute) ->
        ThisApp.temporaryEditWrapper.startEdit $('#sky-editor'), model, attribute

      #PRODUCT SUMMARY -> BOTTOM PANE
      ThisApp.productSummariesView.on 'edit:click', (e, model, attribute) ->
        ThisApp.productSummaryEditOptions.startEdit $('#sky-editor'), model, attribute

      ThisApp.productSummariesView.on 'import:click', (model) ->
        quality = accounting.parse(@ui.importQuality.inputmask('unmaskedvalue'))
        price = accounting.parse(@ui.importPrice.inputmask('unmaskedvalue'))
        ThisApp.temporaryProductsView.addImport model, quality, price
        @collection.remove model

      ThisApp.productSummariesView.onClose = ->
        Zeprj.log 'Cloused!'

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