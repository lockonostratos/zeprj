Zeprj.module "CustomerApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.TestView = Marionette.ItemView.extend
    template: JST['templates/customer/test']
    className: 'content'
    ui:
      Name1: '#gera-name'
      Area1: '#gera-area'

    initialize: ->
    onShow: ->
      $(document).foundation()
      Zeprj.log('dfs')
      @ui.Name1.val('SangKhung')

    events:
      'click input[type=submit]': ->
        @ui.Name1.val('SangKhung')
