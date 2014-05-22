Zeprj.TopNavigationLayout = Backbone.Marionette.Layout.extend
  template: JST['backbone/templates/layouts/topNavigation']
  className: 'top-navigation-container'

  regions: {
    navigator: '#tnl-navigator'
    content: '#tnl-content'
  }

  events:
    'click #tnl-navigator li': (e)-> @trigger 'click:menu', e.target.innerHTML

  onShow: ->
    #behavior: { userSelect: true },
    $(@content.el).hammer({dragLockToAxis: true})
    .on 'swipeleft swiperight', (event) =>
      switch event.type
        when 'swipeleft' then @trigger 'swipe:left'
        when 'swiperight' then @trigger 'swipe:right'

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


Zeprj.DualVerticalLayout = Backbone.Marionette.Layout.extend
  template: JST['backbone/templates/layouts/dualVertical']
  className: 'content'

  regions: {
    mainPane: '#dual-top'
    secondaryPane: '#dual-bottom'
  }

Zeprj.DummerLayout = Backbone.Marionette.Layout.extend
  template: JST['backbone/templates/layouts/dummer']
