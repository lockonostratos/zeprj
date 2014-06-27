Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayHobbyView = Marionette.ItemView.extend
    template: JST['templates/customer/detail/mackayHobby']
    className: 'content'
    ui:
      club_name: '#club_name'
      community_activity: '#community_activity'
      political_activity: '#political_activity'
      religious: '#religious'
      conversation_avoids: '#conversation_avoids'
      conversation_enjoy: '#conversation_enjoy'
    initialize: ->
      @listenTo @model, 'change', -> @render()
    onShow: ->
    events:
      'click input[id=update-education]': ->
        @model.save({

        }, {
          success: -> Zeprj.log 'success'
          error: -> Zeprj.log 'error'
        })

      'click span[editor]': (e) ->
        @trigger 'edit:mackayHobby:model:property', @model, $(e.currentTarget).attr('editor')
