Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.NavigationWarehouseOptionView = Marionette.ItemView.extend
    template: JST['templates/metro/navigationWarehouse']