#Zeprj.module "SaleApp.Skull", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
#  ThisApp.Controller =
#    renderInto: (region) ->
#      region.show ThisApp.layout
#      ThisApp.layout.mainPane.show new ThisApp.temporaryProductsView()
#      ThisApp.layout.secondaryPane.show new ThisApp.productSummariesView({
#        collection: Zeprj.request 'skull:entities'
#      })
#
#  ThisApp.addInitializer ->
#    ThisApp.Caption = 'NHẬP SKULL'
#    ThisApp.layout = new Zeprj.DualVerticalLayout()