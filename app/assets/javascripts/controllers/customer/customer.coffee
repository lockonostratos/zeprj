Zeprj.module "CustomerApp", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

# CONTROLLER ----------------------------------------------------------------------------------------------------->
  ThisApp.addInitializer ->
    ThisApp.childApps = ['Home', 'Detail', 'Area']

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
      Zeprj.navigate 'customer/' + appName
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
      'customer': 'customerHome'

  API =
    customerHome: ->
      ThisApp.Controller.renderInto Zeprj.mainRegion
    customerHome: ->
      ThisApp.Controller.renderInto Zeprj.mainRegion, 'Home'
    customerDetail: ->
      ThisApp.Controller.renderInto Zeprj.mainRegion, 'Detail'
    customerArea: ->
      ThisApp.Controller.renderInto Zeprj.mainRegion, 'Area'


  Zeprj.on 'navigate:customer', -> API.customerHome()
  Zeprj.on 'navigate:customer/Home', -> API.customerHome()
  Zeprj.on 'navigate:customer/Detail', -> API.customerDetail()
  Zeprj.on 'navigate:customer/Area', -> API.customerArea()


  Zeprj.addInitializer -> new ThisApp.Router {controller: API}