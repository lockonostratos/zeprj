Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Router = Marionette.AppRouter.extend
    appRoutes:
      '': 'index'

  API =
    index: ->
      Zeprj.navigate('')
      MetroApp.Controller.showContent()

  Zeprj.on 'navigate:metro', ->
    Zeprj.log('Showing Metro')
    API.index()

  Zeprj.addInitializer ->
    new MetroApp.Router {controller: API}