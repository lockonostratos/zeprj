Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Controller =
    showContent: ->
      Zeprj.mainRegion.show(new MetroApp.HomeView)