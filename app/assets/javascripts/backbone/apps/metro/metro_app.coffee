Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Router = Marionette.AppRouter.extend
    appRoutes:
      '': 'index'

  API =
    showMetro: ->
      Zeprj.navigate('');
      MetroApp.Controller.showContent()

  Zeprj.on 'metro:show', ->
    Zeprj.log('Showing Metro')
    API.showMetro()