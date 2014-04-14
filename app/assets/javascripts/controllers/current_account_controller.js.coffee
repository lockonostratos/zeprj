Zeprj.CurrentAccountController = Ember.ObjectController.extend(
  isSignedIn: (->
    @get('content') && this.get('content').get('isLoaded')
  ).property('content.isLoaded')
)
