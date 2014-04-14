#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require zeprj

# for more details see: http://emberjs.com/guides/application/
window.Zeprj = Ember.Application.create({
  LOG_TRANSITION: true
#  rootElement: '#application'
});

Zeprj.ApplicationController = Ember.Controller.extend
  currentUser: ->
    null
