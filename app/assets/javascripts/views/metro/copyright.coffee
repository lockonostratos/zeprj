Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.Copyright = Marionette.ItemView.extend
    template: JST['templates/metro/copyright']
    className: 'copyright row'