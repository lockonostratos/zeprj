Zeprj.module "ViewModels", (ViewModels, ContactManager, Backbone, Marionette, $, _) ->
  ViewModels.MetroWarehouseOption = ->
    @options = kb.collectionObservable(Zeprj.availableWarehouses, {view_model: kb.ViewModel})
    @current = kb.observable(Zeprj.currentWarehouse, 'id')
    return
