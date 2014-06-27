Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.addInitializer ->
    ThisApp.Caption = 'CREATE AREA'
    ThisApp.layout = new Zeprj.DualVerticalLayout()

    ThisApp.customerDetailEditOptions = new Sky.Editor.Wrapper
    #mackayPersonal
      last_name: new Sky.Editor.RenderOption true
      first_name: new Sky.Editor.RenderOption true
      position: new Sky.Editor.RenderOption true
      company_name: new Sky.Editor.RenderOption true
      company_address: new Sky.Editor.RenderOption true
      company_phone: new Sky.Editor.RenderOption true
      date_of_birth: new Sky.Editor.RenderOption true
      place_of_birth: new Sky.Editor.RenderOption true
      home_town: new Sky.Editor.RenderOption true
      home_address: new Sky.Editor.RenderOption true
      home_addres: new Sky.Editor.RenderOption true
      home_phone: new Sky.Editor.RenderOption true
      height: new Sky.Editor.RenderOption true
      weight: new Sky.Editor.RenderOption true
      comment: new Sky.Editor.RenderOption true
    #mackayEducation
      high_school_name: new Sky.Editor.RenderOption true
      high_school_year: new Sky.Editor.RenderOption true
      high_school_graduation_grade: new Sky.Editor.RenderOption true
      university_name: new Sky.Editor.RenderOption true
      university_start_year: new Sky.Editor.RenderOption true
      university_graduate_year: new Sky.Editor.RenderOption true
      university_graduation_grade: new Sky.Editor.RenderOption true
      university_award: new Sky.Editor.RenderOption true
      university_club: new Sky.Editor.RenderOption true
      sports: new Sky.Editor.RenderOption true
      activities: new Sky.Editor.RenderOption true
      feeling_university: new Sky.Editor.RenderOption true
      alternative: new Sky.Editor.RenderOption true
      army_name: new Sky.Editor.RenderOption true
      army_grade: new Sky.Editor.RenderOption true
      army_atitude: new Sky.Editor.RenderOption true
    #mackayCareer
      last_company_name: new Sky.Editor.RenderOption true
      last_company_address: new Sky.Editor.RenderOption true
      last_start_working_date: new Sky.Editor.RenderOption true
      last_position: new Sky.Editor.RenderOption true
      last_company_award: new Sky.Editor.RenderOption true
      last_company_attitude: new Sky.Editor.RenderOption true
      current_company_name: new Sky.Editor.RenderOption true
      current_company_address: new Sky.Editor.RenderOption true
      current_position: new Sky.Editor.RenderOption true
      current_start_working_date: new Sky.Editor.RenderOption true
      current_company_award: new Sky.Editor.RenderOption true
      current_company_attitude: new Sky.Editor.RenderOption true
      short_term_career_plan: new Sky.Editor.RenderOption true
      medium_term_career_plan: new Sky.Editor.RenderOption true
      long_term_career_plan: new Sky.Editor.RenderOption true
      current_concerns: new Sky.Editor.RenderOption true
      relation_with_our_staffs: new Sky.Editor.RenderOption true
      relation_status: new Sky.Editor.RenderOption true
      relation_description: new Sky.Editor.RenderOption true
      relation_essense: new Sky.Editor.RenderOption true
    #mackayFamily
      mariage_status: new Sky.Editor.RenderOption true
      spouse_name: new Sky.Editor.RenderOption true
      spouse_education: new Sky.Editor.RenderOption true
      spouse_hobbies: new Sky.Editor.RenderOption true
      mariage_at: new Sky.Editor.RenderOption true
    #mackayHobby
      club_name: new Sky.Editor.RenderOption true
      community_activity: new Sky.Editor.RenderOption true
      political_activity: new Sky.Editor.RenderOption true
      religious: new Sky.Editor.RenderOption true
      conversation_avoids: new Sky.Editor.RenderOption true
      conversation_enjoy: new Sky.Editor.RenderOption true
    #mackayLifeStyle
      mackay_profile: new Sky.Editor.RenderOption true
      sickness_history: new Sky.Editor.RenderOption true
      current_heath_status: new Sky.Editor.RenderOption true
      enjoy_drink: new Sky.Editor.RenderOption true
      famous_drink: new Sky.Editor.RenderOption true
      drink_tolarence: new Sky.Editor.RenderOption true
      dislike_drink: new Sky.Editor.RenderOption true
      smoke: new Sky.Editor.RenderOption true
      dislike_smoke: new Sky.Editor.RenderOption true
      famous_lunch_restaurant: new Sky.Editor.RenderOption true
      famous_diner_restaurant: new Sky.Editor.RenderOption true
      famous_dishes: new Sky.Editor.RenderOption true
      hate_feed: new Sky.Editor.RenderOption true
      hoobies: new Sky.Editor.RenderOption true
      entertainment_hobbies: new Sky.Editor.RenderOption true
      reading_hoobies: new Sky.Editor.RenderOption true
      holiday_hobbies: new Sky.Editor.RenderOption true
      famous_sports: new Sky.Editor.RenderOption true
      targeted_object: new Sky.Editor.RenderOption true
      expected_from_object: new Sky.Editor.RenderOption true
      adjectives_about_customer: new Sky.Editor.RenderOption true
      best_prounds: new Sky.Editor.RenderOption true
      long_term_target: new Sky.Editor.RenderOption true
      short_term_target: new Sky.Editor.RenderOption true
    #mackayAndCompany
      ethic_cautious: new Sky.Editor.RenderOption true
      customer_feel_obligation: new Sky.Editor.RenderOption true
      obligation_descriptions: new Sky.Editor.RenderOption true
      very_focus: new Sky.Editor.RenderOption true
      very_ethic: new Sky.Editor.RenderOption true
      customer_key_aspect: new Sky.Editor.RenderOption true

  ThisApp.Controller =
    renderInto: (region) ->
      region.show ThisApp.layout
#      @renderCustomer()
      @renderCustomerDetail()
      @handleCustomerDetailEvent()

#    renderCustomer: ->
#      ThisApp.customerView = new ThisApp.CustomerDetailView
#      ThisApp.layout.mainPane.show ThisApp.customerView

    renderCustomerDetail: ->
      ThisApp.customerView = new ThisApp.CustomerDetailView
      ThisApp.layout.secondaryPane.show ThisApp.customerView
    handleCustomerDetailEvent: ->
      ThisApp.customerView.on 'edit:model:property', (model, attribute) ->
        ThisApp.customerDetailEditOptions.startEdit $('#sky-editor'), model, attribute
