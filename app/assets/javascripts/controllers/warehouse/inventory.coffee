Zeprj.module "WarehouseApp.Inventory", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'KIỂM KHO'
    ThisApp.view = new Darius.GridView
      columns: [
        caption: "MÃ"
        key: 'product_code'
        width: '80px'
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


  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.view