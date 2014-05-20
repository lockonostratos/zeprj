Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
      ThisApp.layout.mainPane.show new ThisApp.temporaryProductsView()
      ThisApp.layout.secondaryPane.show new ThisApp.productSummariesView({
        collection: Zeprj.request 'productSummary:entities'
      })

  ThisApp.addInitializer ->
    ThisApp.Caption = 'NHẬP KHO'
    ThisApp.layout = new Zeprj.DualVerticalLayout()