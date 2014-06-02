Zeprj.DualVerticalLayout = Backbone.Marionette.Layout.extend
  template: JST['templates/layouts/dualVertical']
  className: 'content'

  regions: {
    mainPane: '#dual-top'
    secondaryPane: '#dual-bottom'
  }