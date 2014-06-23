Zeprj.module "CustomerApp.Area", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'CREATE AREA'
    ThisApp.layout = new ThisApp.GeraAreaView()

  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout