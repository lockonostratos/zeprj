Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayFamilyView = Backbone.Marionette.ItemView.extend
    template: JST['templates/customer/detail/mackayFamily']
    className: 'content'
    ui:
      mariage_status: '#mariage_status '
      spouse_name: '#spouse_name'
      spouse_education: '#spouse_education'
      spouse_hobbies: '#spouse_hobbies'
      mariage_at: '#mariage_at'
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
        @trigger 'edit:mackayFamily:model:property', @model, $(e.currentTarget).attr('editor')
