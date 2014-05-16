Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Router = Marionette.AppRouter.extend
    appRoutes:
      '': 'index'

  API =
    index: ->
      Zeprj.navigate('')
      MetroApp.Controller.renderSky()

  Zeprj.on 'navigate:metro', ->
    Zeprj.log('Showing Metro')
    API.index()

  Zeprj.addInitializer ->
    #Global variables.
    Zeprj.currentAccount = Zeprj.request 'account:entity', 0
    Zeprj.currentMerchantAccount = Zeprj.request 'merchantAccount:entity', 0

    #Render baseLayout.
    new MetroApp.Router {controller: API}
    Zeprj.navigationRegion.show new MetroApp.NavigationLayout()
    Zeprj.optionRegion.show new MetroApp.OptionView()