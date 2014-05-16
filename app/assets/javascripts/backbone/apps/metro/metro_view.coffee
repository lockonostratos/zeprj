Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.navigationView = Marionette.ItemView.extend
    template: JST['backbone/templates/metro/navigation']
    className: 'navigation row'
    events:
      'click #home-button': -> Zeprj.trigger 'navigate:metro'
      'click #back-button': -> Backbone.history.history.back()
      'click #forward-button': -> Backbone.history.history.forward()

  MetroApp.optionView = Marionette.ItemView.extend
    template: JST['backbone/templates/metro/option']
    className: 'option row'

  MetroApp.homeView = Marionette.ItemView.extend
    template: JST['backbone/templates/metro/home']
    events:
      'click #warehouse-manager': 'navigateWarehouseApp'

    navigateWarehouseApp: -> Zeprj.trigger 'navigate:warehouse'

  MetroApp.innerNavigationView = Marionette.ItemView.extend
    template: JST['backbone/templates/layouts/innerNavigation']

  MetroApp.addInitializer ->
    MetroApp.innerLayout = new Zeprj.TopNavigationLayout()
    MetroApp.innerNavigation = new MetroApp.innerNavigationView()
