Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
      ThisApp.layout.mainPane.show new ThisApp.temporaryProductsView()
      ThisApp.layout.secondaryPane.show ThisApp.productSummariesView
      ThisApp.productSummariesView.collection.fetch()

      ThisApp.productSummariesView.on 'item:click', (model, attribute) ->
        ThisApp.currentModel = model

  ThisApp.addInitializer ->
    ThisApp.Caption = 'NHẬP KHO'
    ThisApp.layout = new Zeprj.DualVerticalLayout()
    ThisApp.productSummariesView = new ThisApp.productSummariesView
      collection: Zeprj.request 'productSummary:entities'