Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.HomeView = Marionette.ItemView.extend
    template: JST['templates/metro/home']
    className: 'metro-wrapper'
    events:
      'click #warehouse-manager': 'navigateWarehouseApp'
      'click #sale-skull': 'navigateSaleApp'
      'click #sale-home': 'navigateSaleApp'
      'click #customer-home': 'navigateCustomerApp'

    navigateWarehouseApp: -> Zeprj.trigger 'navigate:warehouse'
    navigateSaleApp: -> Zeprj.trigger 'navigate:sale'
    navigateCustomerApp: -> Zeprj.trigger 'navigate:customer'