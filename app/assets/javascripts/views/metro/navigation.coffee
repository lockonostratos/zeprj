Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.NavigationView = Marionette.CompositeView.extend
    template: JST['templates/metro/navigation']
    className: 'navigation row'
    events:
      'click #home-button': -> Zeprj.trigger 'navigate:metro'
      'click #back-button': -> Backbone.history.history.back()
      'click #forward-button': -> Backbone.history.history.forward()