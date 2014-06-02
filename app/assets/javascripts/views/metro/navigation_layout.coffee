Zeprj.module "MetroApp", (MetroApp, Zeprj, Backbone, Marionette, $, _) ->
  MetroApp.NavigationLayout = Marionette.Layout.extend
    template: JST['templates/metro/navigation']
    className: 'navigation row'

    events:
      'click #home-button': -> Zeprj.trigger 'navigate:metro'

    regions:
      accountRegion: '#account-region'
      merchantAccountRegion: '#merchant-account-region'
      warehouseSelectionRegion: '#warehouse-selection-region'

    onShow: ->
      @accountRegion.show new MetroApp.NavigationAccountView()
#      @merchantAccountRegion.show new MetroApp.NavigationMerchantAccountView()
#      @warehouseSelectionRegion.show new MetroApp.NavigationWarehouseOptionView()
#      ko.applyBindings Zeprj.warehouseOptionVm, $(@warehouseSelectionRegion.el)[0]
