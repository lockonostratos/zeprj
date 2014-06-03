Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  class ThisApp.ProductSummaryView extends Marionette.ItemView
    template: JST['templates/warehouse/import/productSummary']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click span[editor]': (e) -> @trigger 'edit:model:property', @model, $(e.currentTarget).attr('editor')
      'click .up.link': -> @trigger 'add:import', @model
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

    initialize: ->
      @on 'itemview:edit:model:property', (e, model, attribute) -> @trigger 'edit:model:property', e, model, attribute
      @on 'itemview:add:import', (e, model) ->  @trigger 'add:import', model
      @on 'itemview:save:model', (e, model) -> @trigger 'sync:edit', model
    onShow: ->
      $('input[inputmask-alias]').each ->
        $(@).inputmask($(@).attr('inputmask-alias'))
    events:
      'keyup #sky-editor': 'editAction'
      'keydown #sky-editor': 'keydownAction'
      'click #sky-new': 'createAction'
    editAction: -> @trigger 'model:editing'
    keydownAction: (e)->
      if e.keyCode == 9
        e.preventDefault()
        @trigger 'editor:tab', e
    createAction: ->
      @collection.add(new Zeprj.Entities.ProductSummary)
