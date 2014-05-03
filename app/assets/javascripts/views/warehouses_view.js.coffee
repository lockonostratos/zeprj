# for more details see: http://emberjs.com/guides/views/

Zeprj.WarehousesView = Ember.View.extend
  templateName: 'warehouses'

Zeprj.WarehousesImportView = Ember.View.extend
  classNames: ['imports-wrapper']
  didInsertElement: ->
    $(@get('element')).split
      orientation: 'vertical',
      limit: 250,
      position: '40%'

Zeprj.WarehousesProductSummariesView = Ember.View.extend
  didInsertElement: ->
    input = $(@get('element')).find('#imgInp')
    image =  $(@get('element')).find('#image')

    input.hide()
    image.parent().click -> input.click()
    input.change -> systemjs.renderImage(@, image)
