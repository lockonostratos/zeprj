Zeprj.module "CustomerApp.Home", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.CustomerSummaryView extends Marionette.ItemView
    template: JST['templates/customer/home/customerSummary']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click span[editor]': (e) -> @trigger 'edit:model:property', @model, $(e.currentTarget).attr('editor')
      'click .update.link':  -> @trigger 'create:customer', @model
      'click .delete.link': (e) -> @trigger 'destroy:model', @model
      'click .detail.link': (e) -> @trigger 'detail:model', @model

    initialize: ->
      @listenTo @model, 'change', -> @render()

  # COLLECTION ---------------------------------------------------------------------------------------------------->
  class ThisApp.CustomerSummariesView extends Marionette.CompositeView
    template: JST['templates/customer/home/customerSummaries']
    className: 'import-product-summary-wrapper'
    itemView: ThisApp.CustomerSummaryView
    itemViewContainer: ".tile-container"
    emptyView: ThisApp.EmptyCustomerSummariesView
    ui:
      skyEditor: '#sky-editor'
      itemContainer: '.title-container'
    events:
      'click #sky-new': 'createAction'

    initialize: ->
      @on 'itemview:edit:model:property', (e, model, attribute) -> @trigger 'edit:model:property', e, model, attribute
      @on 'itemview:create:customer', (e, model) -> @trigger 'create:customer', model
      @on 'itemview:destroy:model', (e, model) -> @destroyCustomer e, model
      @on 'itemview:detail:model', (e, model) -> @trigger 'detail:customer', model


    onShow: ->
#      $('input[inputmask-alias]').each -> $(@).inputmask($(@).attr('inputmask-alias'))
#      $(@ui.itemContainer).mousewheel (event, delta) ->
#        @scrollleft -= delta * 30
#        event.preventDefault()

    createAction: ->
      model = new Zeprj.Entities.GeraCustomer
        gera_area_id: null
        gera_account_id: Zeprj.currentAccount.get 'id'
#        name: 'Tên Khách Hàng'
      #        name_company: 'Tên Công Ty'
      #        position_company: 'Chức Vụ'
      #        address: 'Địa Chỉ Khách Hàng'
      #        email: 'Email Khach Hàng'
      #        phone: '000-000-000'
      @collection.add(model)

    destroyCustomer: (e, model) ->
      model.destroy
        wait: true
        success: (model, message) => @trigger 'destroy:model:success', model, message

