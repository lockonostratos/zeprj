Zeprj.DualHorizontalLayout = Backbone.Marionette.Layout.extend
  template: JST['templates/layouts/dualHorizontal']
  className: 'content'

  regions: {
    mainPane: '#dual-left'
    secondaryPane: '#dual-right'
  }

  onShow: ->
    @$el.split
      orientation: 'vertical'
      limit: 250
      position: '70%'
