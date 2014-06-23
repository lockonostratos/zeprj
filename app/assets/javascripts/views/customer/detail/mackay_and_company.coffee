Zeprj.module "CustomerApp", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayAndCompanyView = Marionette.ItemView.extend
    template: JST['templates/customer/mackayAndCompany']
    className: 'content'
