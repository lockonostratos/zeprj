Zeprj.module "ViewModels", (ViewModels, ContactManager, Backbone, Marionette, $, _) ->
  ViewModels.MetroWarehouseOption = ->
    @options = kb.collectionObservable(Zeprj.availableWarehouses)
    @current = kb.observable(Zeprj.currentWarehouse, 'id')

    @onChange = ->
      Zeprj.currentMerchantAccount.set('current_warehouse_id', Zeprj.currentWarehouseId())
      Zeprj.currentMerchantAccount.save()
    return

  ViewModels.metroWarehouseOption = new ViewModels.MetroWarehouseOption()