Zeprj.ThirdHorizontalLayout = Backbone.Marionette.Layout.extend
  template: JST['templates/layouts/thirdHorizontal']
  className: 'content'

  regions: {
    mainPane: '#third-left'
    secondaryPane: '#third-middle'
    thirdaryPane: '#third-right'
  }