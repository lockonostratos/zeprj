Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.HomeView = Marionette.ItemView.extend
    template: JST['backbone/templates/metroView']

    events:
      'click #warehouse-manager': 'navigateWarehouseApp'

    navigateWarehouseApp: ->
      Zeprj.log 'navigating warehouse app!'