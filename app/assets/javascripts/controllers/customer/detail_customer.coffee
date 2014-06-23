Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'CREATE AREA'
    ThisApp.layout = new Zeprj.DualVerticalLayout()

    ThisApp.customerDetailOptions = new Sky.Editor.Wrapper
      name: new Sky.Editor.RenderOption true
      position_company: new Sky.Editor.RenderOption true
      name_company: new Sky.Editor.RenderOption true
      address: new Sky.Editor.RenderOption true
      phone: new Sky.Editor.RenderOption true
      email: new Sky.Editor.RenderOption true

  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
      @renderCustomer()
#      @renderCustomerDetail()
#      @handleCustomerDetailEvent()

    renderCustomer: ->
      ThisApp.customerView = new ThisApp.CustomerDetailView
      ThisApp.layout.mainPane.show ThisApp.customerView
#
#    renderCustomerDetail: ->
#      ThisApp.customerView = new ThisApp.CustomerDetailView()
#      ThisApp.layout.mainPane.show ThisApp.customerView