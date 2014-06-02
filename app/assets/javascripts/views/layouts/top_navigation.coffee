Zeprj.TopNavigationLayout = Backbone.Marionette.Layout.extend
  template: JST['templates/layouts/topNavigation']
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