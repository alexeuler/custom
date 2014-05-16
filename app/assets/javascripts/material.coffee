window.App||={}
class App.Material
  constructor: ->
    $(".material-cell").on "click", (e)->
      material = $(e.target).attr("fabric-name")
      App.builder.update base: material: material
