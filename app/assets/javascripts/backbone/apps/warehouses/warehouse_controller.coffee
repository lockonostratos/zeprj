Zeprj.module "WarehouseApp", (WarehouseApp, Zeprj, Backbone, Marionette, $, _) ->
  WarehouseApp.Controller =
    renderInto: (region) ->
      #Đổi layout của mainRegion thành innerLayout!
      region.show Zeprj.MetroApp.innerLayout
      #Render [navigator] dùng VIEW của [MetroApp]
      Zeprj.MetroApp.innerLayout.navigator.show Zeprj.MetroApp.innerNavigation
      #Render [Warehouse.Import] vào innerLayout!
      WarehouseApp.Import.Controller.renderInto(Zeprj.MetroApp.innerLayout.content)

    renderChildApp: ->

    navigateNext: ->

    navigatePrevious: ->