#=require ./metro_view

Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Controller =
    renderGlobalUi: ->
      Zeprj.navigationRegion.show new MetroApp.NavigationLayout
      ko.applyBindings { currentApp: MetroApp.currentApp }, $('#navigation-right-part')[0]
      Zeprj.optionRegion.show new MetroApp.OptionView()
      Zeprj.afterMainRegion.show new MetroApp.Copyright()

    renderInto: (region) ->
      region.show new MetroApp.HomeView()
      Zeprj.currentApp = MetroApp

  MetroApp.addInitializer ->
    MetroApp.homeView = new MetroApp.HomeView()
    MetroApp.currentApp = ko.observable('Metro')