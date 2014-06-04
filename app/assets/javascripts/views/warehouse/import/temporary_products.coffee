Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  class ThisApp.TemporaryProductView extends Marionette.ItemView
    template: JST['templates/warehouse/import/temporaryProduct']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click span[editor]': (e) -> @trigger 'edit:model:property', @model, $(e.currentTarget).attr('editor')
      'click .delete.link': (e) -> @trigger 'destroy:model', @model
    initialize: ->
      @listenTo @model, 'change', -> @render()

  # COLLECTION ---------------------------------------------------------------------------------------------------->
  class ThisApp.TemporaryProductsView extends Marionette.CollectionView
    itemView: ThisApp.TemporaryProductView
    emptyView: ThisApp.EmptyTemporaryProductsView
    tagName: 'ul'
    className: 'tile-container'
    initialize: ->
      @on 'itemview:edit:model:property', (e, model, attribute) -> @trigger 'edit:model:property', e, model, attribute
      @on 'itemview:destroy:model', (e, model) -> @destroyImport e, model

    createImport: (model, importQuality, importPrice) ->
      @collection.create {
        product_summary_id: model.get 'id'
        warehouse_id: Zeprj.currentMerchantAccount.get 'current_warehouse_id'
        merchant_account_id: Zeprj.currentMerchantAccount.get 'id'
        import_quality: importQuality
        import_price: importPrice

        name: model.get 'name'
        product_code: model.get 'product_code'
      } , {
        wait: true
        success: (model, message) =>
          @trigger 'item:create:success', model, message
          @collection.where {id: message.id}
        error: (model, error) -> @trigger 'item:create:error', model, error
      }

    destroyImport: (e, model) ->
      model.destroy
        wait: true
        success: (model, message) => @trigger 'destroy:model:success', model, message
