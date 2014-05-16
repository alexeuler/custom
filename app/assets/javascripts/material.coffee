window.App||={}
class App.Material
  constructor: ->
    $(".material-cell").on "click", (e)->
      id = parseInt(e.target.id)
      material = App.materials[id]
      alert material
      App.builder.update base: material: material
