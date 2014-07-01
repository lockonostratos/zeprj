Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayLifeStyleView = Marionette.ItemView.extend
    template: JST['templates/customer/detail/mackayLifeStyle']
    className: 'content'
    ui:
      mackay_profile: '#mackay_profile'
      sickness_history: '#sickness_history'
      current_heath_status: '#current_heath_status'
      enjoy_drink: '#enjoy_drink'
      famous_drink: '#famous_drink'
      drink_tolarence: '#drink_tolarence'
      dislike_drink: '#dislike_drink'
      smoke: '#smoke'
      dislike_smoke: '#dislike_smoke'
      famous_lunch_restaurant: '#famous_lunch_restaurant'
      famous_diner_restaurant: '#famous_diner_restaurant'
      famous_dishes: '#famous_dishes'
      hate_feed: '#hate_feed'
      hoobies: '#hoobies'
      entertainment_hobbies: '#entertainment_hobbies'
      reading_hoobies: '#reading_hoobies'
      holiday_hobbies: '#holiday_hobbies'
      famous_sports: '#famous_sports'
      targeted_object: '#targeted_object'
      expected_from_object: '#expected_from_object'
      adjectives_about_customer: '#adjectives_about_customer'
      best_prounds: '#best_prounds'
      long_term_target: '#long_term_target'
      short_term_target: '#short_term_target'
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
        @trigger 'edit:mackayLifeStyle:model:property', @model, $(e.currentTarget).attr('editor')
