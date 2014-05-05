Ember.Handlebars.registerBoundHelper 'renderEditor', (model) ->
  console.log model
  result = model + '^^'

Ember.Handlebars.registerBoundHelper 'dynamicModelProperty', (property) ->
  new Handlebars.SafeString 'model.' + property