Zeprj.module "SaleApp", (SaleApp, Zeprj, Backbone, Marionette, $, _) ->
  SaleApp.Router = Marionette.AppRouter.extend
    appRoutes:
      'sale': 'saleHome'

  API =
    saleHome: ->
      Zeprj.navigate('saleHome')
      SaleApp.Controller.renderInto(Zeprj.mainRegion)

  Zeprj.on 'navigate:sale', -> API.saleHome()
  Zeprj.on 'navigate:saleHome', -> API.saleHome()

  Zeprj.addInitializer -> new SaleApp.Router {controller: API}
