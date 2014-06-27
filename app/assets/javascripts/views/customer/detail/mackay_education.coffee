Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayEducationView = Marionette.ItemView.extend
    template: JST['templates/customer/detail/mackayEducation']
    className: 'content'
    ui:
      high_school_name: '#high_school_name'
      high_school_year: '#high_school_year'
      high_school_graduation_grade: '#high_school_graduation_grade'
      university_name: '#university_name'
      university_start_year: '#university_start_year'
      university_graduate_year: '#university_graduate_year'
      university_graduation_grade: '#university_graduation_grade'
      university_award: '#university_award'
      university_club: '#university_club'
      sports: '#sports'
      activities: '#activities'
      feeling_university: '#feeling_university'
      alternative: '#alternative'
      army_name: '#army_name'
      army_grade: '#army_grade'
      army_atitude: '#army_atitude'


    initialize: ->
      @listenTo @model, 'change', -> @render()
    onShow: ->
      $(document).foundation()
    events:
      'click input[id=update-education]': ->
        @model.save({
          high_school_name: @ui.high_school_name.val()
          high_school_year: @ui.high_school_year.val()
          high_school_graduation_grade: @ui.high_school_graduation_grade.val()
          university_name: @ui.university_name.val()
          university_start_year: @ui.university_start_year.val()
          university_graduate_year: @ui.university_graduate_year.val()
          university_graduation_grade: @ui.university_graduation_grade.val()
          university_award: @ui.university_award.val()
          university_club: @ui.university_club.val()
          sports: @ui.sports.val()
          activities: @ui.activities.val()
          feeling_university: @ui.feeling_university.val()
          alternative: @ui.alternative.val()
          army_name: @ui.army_name.val()
          army_grade: @ui.army_grade.val()
          army_atitude: @ui.army_atitude.val()
        }, {
          success: -> Zeprj.log 'success'
          error: -> Zeprj.log 'error'
        })

      'click span[editor]': (e) ->
        @trigger 'edit:mackayEducation:model:property', @model, $(e.currentTarget).attr('editor')

