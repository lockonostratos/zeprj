Zeprj.module "WarehouseApp", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.Controller =
    renderInto: (region, appName = 'Import') ->
      ThisApp.region = region
      ThisApp.childIndex = ko.observable ThisApp.childApps.indexOf appName

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
#      ko.applyBindings {items: ThisApp.childApps}, ThisApp.navigationView.$el

    navigateTo: (appName)->
      ThisApp[appName].Controller.renderInto ThisApp.layout.content

    navigateNext: ->
      nextPosition = ThisApp.childIndex() + 1
      Zeprj.log 'next: ' + nextPosition
      if nextPosition < ThisApp.childApps().length
        ThisApp.childIndex nextPosition
        @navigateTo ThisApp.childApps()[nextPosition]
      return

    navigatePrevious: ->
      nextPosition = ThisApp.childIndex() - 1
      Zeprj.log 'prev: ' + nextPosition
      if nextPosition >= 0
        ThisApp.childIndex nextPosition
        @navigateTo ThisApp.childApps()[nextPosition]
      return

  ThisApp.addInitializer ->
    ThisApp.childApps = ko.observableArray ['Import', 'Inventory']
    ThisApp.layout = new Zeprj.TopNavigationLayout()
