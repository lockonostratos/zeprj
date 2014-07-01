Zeprj.ThirdVerticalLayout = Backbone.Marionette.Layout.extend
  template: JST['templates/layouts/thirdVertical']
  className: 'content'

  regions: {
    mainPane: '#third-top'
    secondaryPane: '#third-center'
    thirdPane: '#third-bottom'
  }