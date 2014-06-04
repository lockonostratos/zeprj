Zeprj.module "SaleApp", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # CONTROLLER ----------------------------------------------------------------------------------------------------->
  ThisApp.addInitializer ->
    ThisApp.childApps = ['Home', 'Skull', 'Provider']

  ThisApp.Controller =
    renderInto: (region, appName = 'Home') ->
      ThisApp.layout = new Zeprj.TopNavigationLayout()
      ThisApp.navigationVm = new Zeprj.ViewModels.InnerNavigationVm ThisApp.childApps, appName
      ThisApp.region = region
      ThisApp.region.show ThisApp.layout
      @renderNavigatorInto ThisApp.layout.navigator
      @navigateTo appName
      @registerEvents()

    renderNavigatorInto: (region)->
      ThisApp.navigationView = new Zeprj.MetroApp.InnerNavigationView()
      region.show ThisApp.navigationView
      ko.applyBindings ThisApp.navigationVm, ThisApp.navigationView.$el[0]

    registerEvents: ->
      ThisApp.layout.on 'swipe:left', => @navigateNext() if Zeprj.debugMode or Modernizr.touch
      ThisApp.layout.on 'swipe:right', => @navigatePrevious() if Zeprj.debugMode or Modernizr.touch
      ThisApp.layout.on 'click:menu', (appName) =>
        @navigateTo appName
        ThisApp.navigationVm.navigateTo appName

    navigateTo: (appName)->
      Zeprj.navigate 'sale/' + appName
      ThisApp[appName].Controller.renderInto ThisApp.layout.content
      Zeprj.currentApp = ThisApp[appName]
      Zeprj.MetroApp.currentApp ThisApp[appName].Caption

    navigateNext: ->
      @navigateTo ThisApp.navigationVm.navigateNext() if ThisApp.navigationVm.canNavigateNext()

    navigatePrevious: ->
      @navigateTo ThisApp.navigationVm.navigatePrevious() if ThisApp.navigationVm.canNavigatePrevious()

  # API & ROUTES SETUP --------------------------------------------------------------------------------------------->
  ThisApp.Router = Marionette.AppRouter.extend
    appRoutes:
      'sale': 'saleHome'

  API =
    saleHome: ->
      ThisApp.Controller.renderInto Zeprj.mainRegion
    saleHome: ->
      ThisApp.Controller.renderInto Zeprj.mainRegion, 'Home'
    saleSkull: ->
      ThisApp.Controller.renderInto Zeprj.mainRegion, 'Skull'
    saleProvider: ->
      ThisApp.Controller.renderInto Zeprj.mainRegion, 'Provider'
  Zeprj.on 'navigate:sale', -> API.saleHome()
  Zeprj.on 'navigate:sale/Home', -> API.saleHome()
  Zeprj.on 'navigate:sale/Skull', -> API.saleSkull()
  Zeprj.on 'navigate:sale/Provider', -> API.saleProvider()

  Zeprj.addInitializer -> new ThisApp.Router {controller: API}