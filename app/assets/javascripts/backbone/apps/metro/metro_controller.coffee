#=require ./metro_view

Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Controller =
    renderGlobalUi: ->
      Zeprj.navigationRegion.show new MetroApp.NavigationLayout()
      Zeprj.optionRegion.show new MetroApp.OptionView()
    renderSky: ->
      Zeprj.mainRegion.show new MetroApp.HomeView()