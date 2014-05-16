window.App||={}
class App.Material
  constructor: ->
    $(".material-cell").on "click", (e)->
      console.log e
