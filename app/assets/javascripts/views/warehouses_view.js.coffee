# for more details see: http://emberjs.com/guides/views/

Zeprj.WarehousesView = Ember.View.extend
  templateName: 'warehouses'

Zeprj.WarehousesImportView = Ember.View.extend
  classNames: ['imports-wrapper']
  didInsertElement: ->
    console.log $(@get('element')).split
      orientation: 'vertical',
      limit: 200,
      position: '30%'

Zeprj.WarehousesProductSummariesView = Ember.View.extend
  didInsertElement: ->
    console.log($(@get('element')))
#    console.log(window.jQuery)
