window.App||={}
$ ->
  App.builder = new App.Builder
  App.builder.update_all()

  $(".base-material-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update base: material: material

  $(".cuffs-material-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update cuffs: material: material

  $(".sleeves-material-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update sleeves: material: material

  $(".collar-material-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update collar: material: material

  $(".collar-material-inner-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update collar_inner: material: material

  $(".buttons-material-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update base_inner: material: material
