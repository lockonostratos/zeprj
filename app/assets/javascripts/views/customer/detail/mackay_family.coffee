Zeprj.module "CustomerApp", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayFamilyView = Backbone.Marionette.ItemView.extend
    template: JST['templates/customer/mackayFamily']
    className: 'content'
