Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayAndCompanyView = Marionette.ItemView.extend
    template: JST['templates/customer/detail/mackayAndCompany']
    className: 'content'
    ui:
      ethic_cautious: '#ethic_cautious'
      customer_feel_obligation: '#customer_feel_obligation'
      obligation_descriptions: '#obligation_descriptions'
      very_focus: '#very_focus'
      very_ethic: '#very_ethic'
      customer_key_aspect: '#customer_key_aspect'
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
        @trigger 'edit:mackayAndCompany:model:property', @model, $(e.currentTarget).attr('editor')