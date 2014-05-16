Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Controller =
    renderSky: ->
      Zeprj.mainRegion.show new MetroApp.HomeView()