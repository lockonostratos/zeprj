Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.NavigationLayout = Marionette.Layout.extend
    template: JST['backbone/templates/metro/navigation']
    className: 'navigation row'

    events:
      'click #home-button': -> Zeprj.trigger 'navigate:metro'
      'click #back-button': -> Backbone.history.history.back()
      'click #forward-button': -> Backbone.history.history.forward()

    regions:
      accountRegion: '#account-region'

    onShow: ->
      @accountRegion.show new MetroApp.OptionView()

  MetroApp.NavigationView = Marionette.ItemView.extend
    template: JST['backbone/templates/metro/navigation']
    className: 'navigation row'
    events:
      'click #home-button': -> Zeprj.trigger 'navigate:metro'
      'click #back-button': -> Backbone.history.history.back()
      'click #forward-button': -> Backbone.history.history.forward()


  MetroApp.OptionView = Marionette.ItemView.extend
    template: JST['backbone/templates/metro/option']
    className: 'option row'

  MetroApp.HomeView = Marionette.ItemView.extend
    template: JST['backbone/templates/metro/home']
    events:
      'click #warehouse-manager': 'navigateWarehouseApp'

    navigateWarehouseApp: -> Zeprj.trigger 'navigate:warehouse'

  MetroApp.InnerNavigationView = Marionette.ItemView.extend
    template: JST['backbone/templates/layouts/innerNavigation']

  MetroApp.addInitializer ->
    MetroApp.homeView = new MetroApp.HomeView()
    MetroApp.innerLayout = new Zeprj.TopNavigationLayout()
    MetroApp.innerNavigation = new MetroApp.InnerNavigationView()
