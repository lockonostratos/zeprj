Zeprj.module "CustomerApp", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayCareerView = Marionette.ItemView.extend
    template: JST['templates/customer/mackayCareer']
    className: 'content'
