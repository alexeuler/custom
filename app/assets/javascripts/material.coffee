window.App||={}
class App.Material
  constructor: ->
    $(".base-material-container .material-cell").on "click", (e)->
      material = $(e.target).attr("fabric-name")
      App.builder.update base: material: material
