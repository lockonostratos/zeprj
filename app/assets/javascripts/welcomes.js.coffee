#= require libraries/underscore
#= require libraries/backbone
#= require libraries/backbone.marionette
#= require_tree ./backbone/templates

Zeprj = new Backbone.Marionette.Application

Zeprj.Account = Backbone.Model.extend()
Zeprj.Accounts = Backbone.Collection.extend
  model: Zeprj.Account

Zeprj.AccountView = Backbone.Marionette.ItemView.extend
  template: JST['backbone/templates/accountView']

Zeprj.NoAccountsView = Backbone.Marionette.ItemView.extend
  template: JST['backbone/templates/noAccountsView']

Zeprj.AccountsView = Backbone.Marionette.CollectionView.extend
  itemView: Zeprj.AccountView
  emptyView: Zeprj.NoAccountsView

Zeprj.FormView = Backbone.Marionette.ItemView.extend
  template: JST['backbone/templates/formView']
  events: {
    'click button': 'createNewAccount'
  }
  ui: {
    name: '#name'
    age: '#age'
  }

  createNewAccount: ->
    console.log("asdasd")
    @collection.add {
      name: @ui.name.val()
      age: @ui.age.val()
    }
    console.log("1234")
    @ui.name.val('')
    @ui.age.val('')

Zeprj.MetroView = Backbone.Marionette.ItemView.extend
  template: JST['backbone/templates/metroView']

Zeprj.addRegions
  mainRegion: '#main-region'
  afterMainRegion: '#after-main-region'
  endingRegion: '#ending-region'

Zeprj.on 'initialize:after', (options) ->
  if Backbone.history
    Backbone.history.start()

Zeprj.addInitializer ->
  Zeprj.accounts = new Zeprj.Accounts()

  Zeprj.mainRegion.show(new Zeprj.MetroView())
  Zeprj.afterMainRegion.show(new Zeprj.FormView { collection: Zeprj.accounts})
  Zeprj.endingRegion.show(new Zeprj.AccountsView { collection: Zeprj.accounts })

Zeprj.start()