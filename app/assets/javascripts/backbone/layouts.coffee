Zeprj.TopNavigationLayout = Backbone.Marionette.Layout.extend
  template: JST['backbone/templates/layouts/topNavigation']

  regions: {
    navigator: '#tnl-navigator'
    content: '#tnl-content'
  }