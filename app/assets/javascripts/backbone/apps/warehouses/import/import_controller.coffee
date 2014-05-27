Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
      ThisApp.layout.mainPane.show new ThisApp.TemporaryProductsView()
      ThisApp.productSummariesView = new ThisApp.ProductSummariesView
        collection: Zeprj.request 'productSummary:entities'
      ThisApp.layout.secondaryPane.show ThisApp.productSummariesView

      ThisApp.productSummariesView.on 'item:click', (e, model, attribute) ->
        Sky.Editor.onStartEditHandler $('#sky-editor'), model, ThisApp.productSummaryEditOptions, attribute

      ThisApp.productSummariesView.on 'editor:tab', (e) ->
        Sky.Editor.onTabNavigationHandler e, ThisApp.productSummaryEditOptions

      ThisApp.productSummariesView.on 'model:editing', ->
        Sky.Editor.onEditingHandler $('#sky-editor'), ThisApp.productSummaryEditOptions

  ThisApp.addInitializer ->
    ThisApp.Caption = 'NHẬP KHO'
    ThisApp.layout = new Zeprj.DualVerticalLayout()

    ThisApp.productSummaryEditOptions = new Sky.Editor.EditOptions
      product_code: new Sky.Editor.RenderOption true, 'barcode'
      name: new Sky.Editor.RenderOption()
      quality: new Sky.Editor.RenderOption false
      price: new Sky.Editor.RenderOption true, '#'