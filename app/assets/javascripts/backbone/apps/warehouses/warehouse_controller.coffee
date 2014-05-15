Zeprj.module "WarehouseApp", (WarehouseApp, Zeprj, Backbone, Marionette, $, _) ->
  WarehouseApp.Controller =
    showHome: ->
      #Khi chuyển qua layout con, thì đổi mainRegion.
      Zeprj.mainRegion.show Zeprj.MetroApp.innerLayout
      #Rồi Render layout con [navigator] và [content],
      #[navigator] dùng VIEW của [MetroApp]
      Zeprj.MetroApp.innerLayout.navigator.show Zeprj.MetroApp.innerNavigation

      #[content] dùng LAYOUT của trang con hiện tại - ở đây là [Import]
      #Show layout của TRANG lên để có thể render bằng Function.
      Zeprj.MetroApp.innerLayout.content.show Zeprj.WarehouseApp.Import.layout
      WarehouseApp.Import.Controller.renderSky()
