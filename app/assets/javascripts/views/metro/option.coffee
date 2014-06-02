Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.OptionView = Marionette.ItemView.extend
    template: JST['templates/metro/option']
    className: 'option row'