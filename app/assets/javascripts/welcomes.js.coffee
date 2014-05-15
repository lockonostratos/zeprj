#= require backbone/app
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
    'click .debug': 'debugTracer'
  }
  ui: {
    name: '#name'
    age: '#age'
  }

  createNewAccount: ->
    @collection.add {
      name: @ui.name.val()
      age: @ui.age.val()
    }
    @ui.name.val('')
    @ui.age.val('')
    console.log(@collection)

  debugTracer: ->
    console.log(@ui.name.val() + '; ' + @ui.age.val())



Zeprj.addInitializer ->
  Zeprj.accounts = new Zeprj.Accounts()

#  Zeprj.afterMainRegion.show(new Zeprj.FormView { collection: Zeprj.accounts })
#  Zeprj.endingRegion.show(new Zeprj.AccountsView { collection: Zeprj.accounts })

Zeprj.start()