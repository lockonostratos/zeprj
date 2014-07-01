Zeprj.module "CustomerApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'CREATE CUSTOMER'
    ThisApp.layout = new Zeprj.DualVerticalLayout()

    ThisApp.customerSummaryEditOptions = new Sky.Editor.Wrapper
      name: new Sky.Editor.RenderOption true
      position_company: new Sky.Editor.RenderOption true
      name_company: new Sky.Editor.RenderOption true
      address: new Sky.Editor.RenderOption true
      phone: new Sky.Editor.RenderOption true
      email: new Sky.Editor.RenderOption true

  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
      @renderGeraAccount()
      @renderGeraCustomer()
      @handleCustomerSummariesEvent()

    renderGeraAccount: ->
      ThisApp.geraAccountsView = new ThisApp.GeraAccountView()
      ThisApp.layout.mainPane.show ThisApp.geraAccountsView

    renderGeraCustomer: ->
      ThisApp.geraCustomerView = new ThisApp.CustomerSummariesView
        collection: Zeprj.request 'geraCustomer:entities'
      ThisApp.layout.secondaryPane.show ThisApp.geraCustomerView

    handleCustomerSummariesEvent: ->
      ThisApp.geraCustomerView.on 'edit:model:property', (e, model, attribute) ->
        ThisApp.customerSummaryEditOptions.startEdit $('#sky-editor'), model, attribute

      ThisApp.geraCustomerView.on 'create:customer', (model) ->
        model.save({
        }, {
          success: -> Zeprj.log 'success'
          error: -> Zeprj.log 'error'
        }) if (model.get 'name')? and (model.get 'name_company')? and (model.get 'position_company')? and
          (model.get 'address')? and (model.get 'email')? and (model.get 'phone')? and
          (model.get 'name') != "" and (model.get 'name_company') != "" and (model.get 'position_company') != "" and
          (model.get 'address') != "" and (model.get 'email') != "" and (model.get 'phone') != ""







