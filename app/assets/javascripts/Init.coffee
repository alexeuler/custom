window.App ||= {}
$ ->
  App.builder = new App.Builder
  App.builder.update_all()
  $('.modal').appendTo($('body'))

  $("#order").on "click", ->
    yaCounter25080758.reachGoal('click_order')

  $("#order-with-contacts").on "click", ->
    yaCounter25080758.reachGoal('click_order_with_contacts')

  $("#details").on "click", ->
    yaCounter25080758.reachGoal('click_details')

  $("#contacts1, #contacts2").on "click", ->
    yaCounter25080758.reachGoal('click_contacts')

  $("#order-from-main").on "click", ->
    yaCounter25080758.reachGoal('click_order_from_main')

  $("#order-from-details").on "click", ->
    yaCounter25080758.reachGoal('click_order_from_details')

  $(".base-material-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update base:
      material: material

  $(".cuffs-material-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update cuffs:
      material: material

  $(".sleeves-material-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update sleeves:
      material: material

  $(".collar-material-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update collar:
      material: material

  $(".collar-material-inner-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update collar_inner:
      material: material

  $(".buttons-material-container .material-cell").on "click", (e)->
    material = $(e.target).attr("fabric-name")
    App.builder.update base_inner:
      material: material

  $(".cuffs-container .item-cell").on "click", (e)->
    type = $(e.target).attr("name")
    App.builder.update cuffs:
      type: type

  $(".buttons-container .item-cell").on "click", (e)->
    type = $(e.target).attr("name")
    App.builder.update buttons:
      color: type

  $(".collar-container .item-cell").on "click", (e)->
    type = $(e.target).attr("name")
    App.builder.update collar:
      type: type

  $("#sleeves label").on "click", (e) ->
    input = $(e.target).children()[0]
    value = $(input).attr('id')
    if value == "option1"
      App.builder.update sleeves:
          type: "long"
      $(".demo-pane .cuffs").show()
      $(".demo-pane .cuffs-inner").show()
      $(".demo-pane .cuffs-buttons").show()
    else
      App.builder.update sleeves:
          type: "short"
      $(".demo-pane .cuffs").hide()
      $(".demo-pane .cuffs-inner").hide()
      $(".demo-pane .cuffs-buttons").hide()

  $(".order-form").find("input").on "click", (e) ->
    $(".order-form #order_params").attr("value", App.builder.export())
