Zeprj.ModelEditorsComponent = Ember.Component.extend
  keys: (->
    keys = []
    for key in Object.keys(@model._attributes)
      keys.push key
    keys
  ).property()
  currentIndex: 0
  currentKey: (-> @get('keys')[@get('currentIndex')]).property('currentIndex')

  actions: {
    next: ->
      if @get('currentIndex') < @get('keys').length - 1
        @set('currentIndex', @get('currentIndex') + 1)
      else
        @set('currentIndex', 0)

      console.log(@get('currentKey'))
  }
