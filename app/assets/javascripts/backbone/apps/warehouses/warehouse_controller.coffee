Zeprj.module "WarehouseApp", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.Controller =
    renderInto: (region, appName = 'Import') ->
      ThisApp.navigationVm = new Zeprj.ViewModels.InnerNavigationVm ThisApp.childApps, appName
      ThisApp.region = region
      ThisApp.region.show ThisApp.layout
      @renderNavigatorInto(ThisApp.layout.navigator)
      @navigateTo appName

      ThisApp.layout.on 'swipe:left', =>
        @navigateNext() if Zeprj.debugMode or Modernizr.touch

      ThisApp.layout.on 'swipe:right', =>
        @navigatePrevious() if Zeprj.debugMode or Modernizr.touch

    renderNavigatorInto: (region)->
      ThisApp.navigationView = new Zeprj.MetroApp.InnerNavigationView()
      region.show ThisApp.navigationView
      ko.applyBindings ThisApp.navigationVm, ThisApp.navigationView.$el[0]

    navigateTo: (appName)->
      ThisApp[appName].Controller.renderInto ThisApp.layout.content

    navigateNext: ->
      @navigateTo ThisApp.navigationVm.navigateNext() if ThisApp.navigationVm.canNavigateNext()

    navigatePrevious: ->
      @navigateTo ThisApp.navigationVm.navigatePrevious() if ThisApp.navigationVm.canNavigatePrevious()

  ThisApp.addInitializer ->
    ThisApp.childApps = ['Import', 'Inventory']
    ThisApp.layout = new Zeprj.TopNavigationLayout()