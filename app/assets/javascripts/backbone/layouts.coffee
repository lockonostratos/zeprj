Zeprj.TopNavigationLayout = Backbone.Marionette.Layout.extend
  template: JST['backbone/templates/layouts/topNavigation']
  className: 'right-navigation-container'

  regions: {
    navigator: '#tnl-navigator'
    content: '#tnl-content'
  }

Zeprj.DualHorizontalLayout = Backbone.Marionette.Layout.extend
  template: JST['backbone/templates/layouts/dualHorizontal']
  className: 'content'

  regions: {
    leftPane: '#dual-left'
    rightPane: '#dual-right'
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


