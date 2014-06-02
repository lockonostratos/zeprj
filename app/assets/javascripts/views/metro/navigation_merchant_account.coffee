Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.NavigationMerchantAccountView = Marionette.ItemView.extend
    template: JST['templates/metro/navigationMerchantAccount']
    initialize: ->
      @model = Zeprj.currentMerchantAccount
      @listenTo @model, 'change', -> @render()