Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  class ThisApp.TemporaryProductView extends Marionette.ItemView
    template: JST['templates/warehouse/import/temporaryProduct']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click span[editor]': (e) -> @trigger 'edit:click', @model, $(e.currentTarget).attr('editor')
      'click .delete.link': (e) -> @trigger 'item:delete', @model
    initialize: ->
      @listenTo @model, 'change', -> @render()

  # COLLECTION ---------------------------------------------------------------------------------------------------->
  class ThisApp.TemporaryProductsView extends Marionette.CollectionView
    itemView: ThisApp.TemporaryProductView
    emptyView: ThisApp.EmptyTemporaryProductsView
    tagName: 'ul'
    className: 'tile-container'
    initialize: ->
      @on 'itemview:edit:click', (e, model, attribute) -> @trigger 'edit:click', e, model, attribute
      @on 'itemview:item:delete', (e, model) -> @trigger 'item:delete', e, model

    addImport: (model, importQuality, importPrice) ->
      newImport = @collection.create {
        product_summary_id: model.get 'id'
        warehouse_id: Zeprj.currentMerchantAccount.get 'current_warehouse_id'
        merchant_account_id: Zeprj.currentMerchantAccount.get 'id'
        name: model.get 'name'
        import_quality: importQuality
        import_price: importPrice
        skull_id: model.get 'skull_id'
      } , {
        wait: true
        success: (model, message) => @trigger 'item:create', model
        error: (model, error) -> Zeprj.log error
      }