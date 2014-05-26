Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
      ThisApp.layout.mainPane.show new ThisApp.TemporaryProductsView()
      ThisApp.productSummariesView = new ThisApp.ProductSummariesView
        collection: Zeprj.request 'productSummary:entities'
      ThisApp.layout.secondaryPane.show ThisApp.productSummariesView

      ThisApp.productSummariesView.on 'item:click', (e, model, attribute) ->
        $('#sky-editor').val(model.get attribute)
        $('#sky-editor').attr('attr', attribute)
        $('#sky-editor').attr('editor', ThisApp.productSummaryEditOptions.optionOf(attribute).type)
        ThisApp.currentModel = model

      ThisApp.productSummariesView.on 'editor:tab', (e) ->
        currentAttr = $(e.currentTarget).attr('attr')
        if e.shiftKey
          nextAttr = ThisApp.productSummaryEditOptions.previousKeyOf currentAttr
          $(e.currentTarget).attr('attr', nextAttr)
          $(e.currentTarget).val(ThisApp.currentModel.get(nextAttr))
        else
          nextAttr = ThisApp.productSummaryEditOptions.nextKeyOf currentAttr
          $(e.currentTarget).val(ThisApp.currentModel.get(nextAttr))
          $(e.currentTarget).attr('attr', nextAttr)

  ThisApp.addInitializer ->
    ThisApp.Caption = 'NHẬP KHO'
    ThisApp.layout = new Zeprj.DualVerticalLayout()

    ThisApp.productSummaryEditOptions = new Sky.Editor.EditOptions
      product_code: new Sky.Editor.RenderOption()
      name: new Sky.Editor.RenderOption()
      quality: new Sky.Editor.RenderOption false, 'number'
      price: new Sky.Editor.RenderOption()