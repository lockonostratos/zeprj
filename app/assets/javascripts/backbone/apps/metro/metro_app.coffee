Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Router = Marionette.AppRouter.extend
    appRoutes:
      '': 'index'

  API =
    index: ->
      Zeprj.navigate('')
      MetroApp.Controller.renderSky()

  Zeprj.on 'navigate:metro', -> API.index()

  Zeprj.addInitializer ->
    new MetroApp.Router {controller: API}
    #Global variables.
    Zeprj.currentAccount = Zeprj.request 'account:entity', 0
    Zeprj.currentMerchantAccount = Zeprj.request 'merchantAccount:entity', 0
    Zeprj.availableWarehouses = Zeprj.request 'warehouse:entities', {action: 'available'}