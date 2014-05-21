#=require ./metro_view

Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Controller =
    renderGlobalUi: ->
      Zeprj.navigationRegion.show new MetroApp.NavigationLayout()
      Zeprj.optionRegion.show new MetroApp.OptionView()

    renderInto: (region) ->
      region.show new MetroApp.HomeView()

  MetroApp.addInitializer ->
    MetroApp.homeView = new MetroApp.HomeView()