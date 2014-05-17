Zeprj.TopNavigationLayout = Backbone.Marionette.Layout.extend
  template: JST['backbone/templates/layouts/topNavigation']
  className: 'top-navigation-container'

  regions: {
    navigator: '#tnl-navigator'
    content: '#tnl-content'
  }

Zeprj.DualHorizontalLayout = Backbone.Marionette.Layout.extend
  template: JST['backbone/templates/layouts/dualHorizontal']
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
    @$el.hammer({behavior: { userSelect: true }, dragLockToAxis: true})
    .on 'swipeleft swiperight', (event)->
      switch event.type
        when 'swipeleft' then Zeprj.log 'swipeleft left!'
        when 'swiperight' then Zeprj.log 'swipeleft right!'

Zeprj.DualVerticalLayout = Backbone.Marionette.Layout.extend
  template: JST['backbone/templates/layouts/dualVertical']
  className: 'content'

  regions: {
    mainPane: '#dual-top'
    secondaryPane: '#dual-bottom'
  }
#
#  onShow: ->
#    @$el.split
#      orientation: 'horizontal'
#      limit: 100
#      position: '70%'


