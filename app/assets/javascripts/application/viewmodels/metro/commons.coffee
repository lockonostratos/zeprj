Zeprj.module "ViewModels", (Vm, ContactManager, Backbone, Marionette, $, _) ->
  Vm.MetroWarehouseOption = ->
    @options = kb.collectionObservable(Zeprj.availableWarehouses)
    @current = kb.observable(Zeprj.currentWarehouse, 'id')

    @onChange = ->
      Zeprj.currentMerchantAccount.set('current_warehouse_id', Zeprj.currentWarehouseId())
      Zeprj.currentMerchantAccount.save()
    return

  Vm.metroWarehouseOption = new Vm.MetroWarehouseOption()

  class Vm.InnerNavigationVm
    constructor: (childApps, currentApp) ->
      @childApps = ko.observableArray childApps
      @currentApp = ko.observable currentApp

    navigateNext: ->
      nextApp = (@childApps.indexOf @currentApp()) + 1
      if nextApp < @childApps().length
        @currentApp @childApps()[nextApp]
      @currentApp()

    navigatePrevious: ->
      nextApp = (@childApps.indexOf @currentApp()) - 1
      if nextApp >= 0
        @currentApp @childApps()[nextApp]
      @currentApp()
    navigateTo: (appName) ->
      @currentApp appName

    canNavigateNext: ->
      (@childApps.indexOf @currentApp()) + 1 < @childApps().length
    canNavigatePrevious: ->
      (@childApps.indexOf @currentApp()) - 1 >= 0