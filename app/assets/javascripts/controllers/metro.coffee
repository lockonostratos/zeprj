Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->

  # CONTROLLER ------------------------------------------------------------------------------------------------------>
  MetroApp.Controller =
    renderGlobalUi: ->
      Zeprj.navigationRegion.show new MetroApp.NavigationLayout
      ko.applyBindings { currentApp: MetroApp.currentApp }, $('#navigation-right-part')[0]
      # Zeprj.optionRegion.show new MetroApp.OptionView()
      Zeprj.afterMainRegion.show new MetroApp.Copyright()

    renderInto: (region) ->
      region.show new MetroApp.HomeView()
      Zeprj.currentApp = MetroApp

  MetroApp.addInitializer ->
    MetroApp.homeView = new MetroApp.HomeView()
    MetroApp.currentApp = ko.observable('Metro')




  # API & ROUTES SETUP --------------------------------------------------------------------------------------------->
  MetroApp.Router = Marionette.AppRouter.extend
    appRoutes:
      '': 'index'

  API =
    index: ->
      Zeprj.navigate ''
      Zeprj.MetroApp.currentApp('METRO')
      MetroApp.Controller.renderInto Zeprj.mainRegion

  Zeprj.on 'navigate:metro', -> API.index()

  Zeprj.addInitializer ->
    new MetroApp.Router {controller: API}
    #Global variables.
    Zeprj.currentAccount = Zeprj.request 'account:entity', 0
    Zeprj.currentMerchantAccount = Zeprj.request 'merchantAccount:entity', 0
    Zeprj.availableWarehouses = Zeprj.request 'warehouse:entities', {action: 'available', async: false}
    Zeprj.currentWarehouse = Zeprj.request 'warehouse:entity', 0, {async: false}
    Zeprj.warehouseOptionVm = new Zeprj.ViewModels.MetroWarehouseOption()
    Zeprj.currentWarehouseId = -> $('.warehouse-option option:selected')[0].value