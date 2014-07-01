Zeprj.module "CustomerApp.Area", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.GeraAreaView = Marionette.ItemView.extend
    template: JST['templates/customer/area/geraArea']
    className: 'content'

    onShow: ->
      $(document).foundation()
    ui:
      Name: '#area-name'
      Description: '#area-description'
    events:
      'click input[type=button]': ->
        model = new Zeprj.Entities.GeraArea
          name: @ui.Name.val()
          description: @ui.Description.val()
          gera_account_id: Zeprj.currentAccount.get('id')
        model.save()