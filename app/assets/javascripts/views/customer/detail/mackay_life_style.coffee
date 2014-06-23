Zeprj.module "CustomerApp", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayLifeStyleView = Marionette.ItemView.extend
    template: JST['templates/customer/mackayLifeStyle']
    className: 'content'
