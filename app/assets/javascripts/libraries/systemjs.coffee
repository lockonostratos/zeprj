class @systemjs
  @renderImage: (input, img)->
    if(input.files && input.files[0])
      reader = new FileReader()
      reader.onload = (e) ->
        img.attr('src', e.target.result)
      reader.readAsDataURL(input.files[0]);

#class renderable
#  constructor: ->
#    $.each key in agruments[0]