Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
      ThisApp.layout.mainPane.show new ThisApp.TemporaryProductsView()
      ThisApp.productSummariesView = new ThisApp.ProductSummariesView
        collection: Zeprj.request 'productSummary:entities'
      ThisApp.layout.secondaryPane.show ThisApp.productSummariesView

      ThisApp.productSummariesView.on 'item:click', (e, model, attribute) ->
        ThisApp.productSummaryEditOptions.handleEntering $('#sky-editor'), model, attribute
      ThisApp.productSummaryEditOptions.setupEditor($('#sky-editor'))

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