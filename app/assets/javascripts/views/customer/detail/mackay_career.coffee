Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayCareerView = Marionette.ItemView.extend
    template: JST['templates/customer/detail/mackayCareer']
    className: 'content'
    ui:
      last_company_name: '#last_company_name'
      last_company_address: '#last_company_address'
      last_start_working_date: '#last_start_working_date'
      last_company_award: '#last_company_award'
      last_company_award: '#last_company_award'
      last_company_attitude: '#last_company_attitude'
      current_company_name: '#current_company_name'
      current_company_address: '#current_company_address'
      current_position: '#current_position'
      current_start_working_date: '#current_start_working_date'
      current_company_award: '#current_company_award'
      current_company_attitude: '#current_company_attitude'
      short_term_career_plan: '#short_term_career_plan'
      medium_term_career_plan: '#medium_term_career_plan'
      long_term_career_plan: '#long_term_career_plan'
      current_concerns: '#current_concerns '
      relation_with_our_staffs: '#relation_with_our_staffs '
      relation_status: '#relation_status '
      relation_description: '#relation_description '
      relation_essense: '#relation_essense '

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
        @trigger 'edit:mackayCareer:model:property', @model, $(e.currentTarget).attr('editor')