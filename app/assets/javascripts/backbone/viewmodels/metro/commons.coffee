Zeprj.module "ViewModels", (Vm, ContactManager, Backbone, Marionette, $, _) ->
  Vm.MetroWarehouseOption = ->
    @options = kb.collectionObservable(Zeprj.availableWarehouses)
    @current = kb.observable(Zeprj.currentWarehouse, 'id')

    @onChange = ->
      Zeprj.currentMerchantAccount.set('current_warehouse_id', Zeprj.currentWarehouseId())
      Zeprj.currentMerchantAccount.save()
    return

  Vm.metroWarehouseOption = new Vm.MetroWarehouseOption()

  Vm.InnerNavigation = (model)->
    @items = ko.observableArray(model.childApps)
    @current = ko.observable(model.current)


