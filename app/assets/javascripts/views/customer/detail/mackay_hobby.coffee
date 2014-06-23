Zeprj.module "CustomerApp", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayHobbyView = Marionette.ItemView.extend
    template: JST['templates/customer/mackayHobby']
    className: 'content'
