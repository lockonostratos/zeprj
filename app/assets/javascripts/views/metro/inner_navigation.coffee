Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.InnerNavigationView = Marionette.ItemView.extend
    template: JST['templates/layouts/innerNavigation']