Zeprj.module "CustomerApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.GeraAccountView extends Marionette.ItemView
    template: JST['templates/customer/home/geraAccount']
    className: 'item-tile'
    tagName: 'li'
    ui:
      Name: '#gera-account-name'
      Position: '#gera-account-position'
    initialize: ->
      @model = Zeprj.request 'geraAccount:entity', (Zeprj.currentAccount.get 'id')
      @listenTo @model, 'change', -> @render()

    onShow: ->
      $(document).foundation()


#model: Zeprj.request 'geraAccount:entities'