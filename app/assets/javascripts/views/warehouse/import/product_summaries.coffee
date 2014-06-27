Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  class ThisApp.ProductSummaryView extends Marionette.ItemView
    template: JST['templates/warehouse/import/productSummary']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click span[editor]': (e) -> @trigger 'edit:model:property', @model, $(e.currentTarget).attr('editor')
      'click .up.link': -> @trigger 'create:import', @model
      'click .save.link': -> @trigger 'sync:edit', @model
    initialize: ->
      @listenTo @model, 'change', -> @render()


  # COLLECTION ---------------------------------------------------------------------------------------------------->
  class ThisApp.ProductSummariesView extends Marionette.CompositeView
    template: JST['templates/warehouse/import/productSummaries']
    className: 'import-product-summary-wrapper'
    itemView: ThisApp.ProductSummaryView
    itemViewContainer: ".tile-container"
    emptyView: ThisApp.EmptyProductSummariesView
    ui:
      skyEditor: '#sky-editor'
      importQuality: '#import-quality'
      importPrice: '#import-price'
      itemContainer: '.title-container'
    events:
      'click #sky-new': 'createAction'

    initialize: ->
      @on 'itemview:edit:model:property', (e, model, attribute) -> @trigger 'edit:model:property', e, model, attribute
      @on 'itemview:create:import', (e, model) ->  @trigger 'create:import', model
      @on 'itemview:sync:edit', (e, model) -> @trigger 'sync:edit', model

    onShow: ->
      $('input[inputmask-alias]').each -> $(@).inputmask($(@).attr('inputmask-alias'))
      $(@ui.itemContainer).mousewheel (event, delta) ->
        @scrollleft -= delta * 30
        event.preventDefault()

    createAction: ->
      @collection.add(new Zeprj.Entities.ProductSummary)

