Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.NavigationAccountView = Marionette.ItemView.extend
    template: JST['templates/metro/navigationAccount']
    initialize: ->
      @model = Zeprj.currentAccount
      @listenTo @model, 'change', -> @render()