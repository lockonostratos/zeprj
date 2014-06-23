Zeprj.module "CustomerApp", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayChildrenView = Marionette.ItemView.extend
    template: JST['templates/customer/mackayChildren']
    className: 'content'
