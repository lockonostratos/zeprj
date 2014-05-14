Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.homeView = Marionette.ItemView.extend
    template: JST['backbone/templates/metroView']

    events:
      'click #warehouse-manager': 'navigateWarehouseApp'

    navigateWarehouseApp: -> Zeprj.trigger 'navigate:warehouse'
