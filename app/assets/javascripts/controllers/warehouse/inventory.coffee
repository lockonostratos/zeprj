Zeprj.module "WarehouseApp.Inventory", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'KIỂM KHO'

    ThisApp.rowDetailView = new ThisApp.ProductSummaryView
      model: new Backbone.Model
    ThisApp.view = new Darius.Grid
      columns: [
        caption: "MÃ"
        key: 'product_code'
        width: '80px'
        format: ''
      ,
        caption: 'TÊN'
        key: 'name'
      ,
        caption: 'S.LƯỢNG'
        key: 'quality'
        width: '50px'
      ,
        caption: 'GIÁ'
        key: 'price'
        width: '150px'
      ]
      collection: Zeprj.request 'productSummary:entities'
      rowDetail: ThisApp.rowDetailView


  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.view