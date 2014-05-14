Zeprj.module "WarehouseApp", (WarehouseApp, Zeprj, Backbone, Marionette, $, _) ->
  WarehouseApp.Controller =
    showHome: ->
      Zeprj.log 'Showing warehouse-home!'
      WarehouseApp.layout.navigator.show WarehouseApp.layout
