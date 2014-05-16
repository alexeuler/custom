window.App||={}

class App.Builder

  constructor: ->
    @view="front"
    @params=
      base:
        value:
          material: "BSH498"
        updater: @base_update
      base_inner:
        value:
          material: "BSH498"
        updater: @base_inner_update
      buttons:
        value:
          color: "navy"
        updater: @buttons_update
      sleeves:
        value:
          material: "BSH498"
          type: "long"
        updater: @sleeves_update
      collar:
        value:
          material: "BSH498"
          type: "regular"
        updater: @collar_update
      collar_inner:
        value:
          material: "BSH498"
        updater: @collar_inner_update

      cuffs:
        value:
          material: "BSH498"
          type: "round"
        updater: @cuffs_update

  update_all: ->
    for key, value of @params
      value["updater"].call(@)

  update: (params)->
    for key,value of params
      unless @eqs(@params[key]["value"], value)
        @update_hash(@params[key]["value"], value)
        @params[key]["updater"].call(@)


  update_hash: (hash, new_hash) ->
    for key, value of new_hash
      hash[key] = value


  eqs: (a,b) ->
    for key, value of b
      return false unless a[key] == value
    for key, value of a
      return false unless b[key] == value
    return true

  set_bg: (elem, value) ->
    elem.css("background-image", "url('/images/#{value}.png')")

  base_update: ->
    bg = @params["base"]["value"]["material"]+"_#{@view}_base_slim"
    @set_bg($(".base"), bg)

  base_inner_update: ->
    bg = @params["base_inner"]["value"]["material"]+"_#{@view}_base_placket_inner_slim"
    @set_bg($(".base-inner"), bg)

  buttons_update: ->
    color = @params["buttons"]["value"]["color"]
    prefix = "buttons_#{color}_#{@view}_buttons_"
    @set_bg($(".base-buttons"), prefix+"base_slim")
    @set_bg($(".collar-buttons"), prefix+"collar_one_button")
    @set_bg($(".cuffs"), prefix+"cuffs")

  sleeves_update: ->
    bg = @params["sleeves"]["value"]["material"]+"_#{@view}_sleeves_"+@params["sleeves"]["value"]["type"]+"_slim"
    @set_bg($(".sleeves"), bg)

  collar_update: ->
    bg = @params["collar"]["value"]["material"]+"_#{@view}_collar_"+@params["collar"]["value"]["type"]
    @set_bg($(".collar"), bg)

  collar_inner_update: ->
    bg = @params["collar_inner"]["value"]["material"]+"_#{@view}_collar_"+@params["collar"]["value"]["type"]+"_inner"
    @set_bg($(".collar-inner"), bg)

  cuffs_update: ->
    prefix = @params["cuffs"]["value"]["material"]+"_#{@view}_cuffs_"+@params["cuffs"]["value"]["type"]
    @set_bg($(".cuffs-slim"), prefix+"_slim")
    @set_bg($(".cuffs-inner"), prefix+"_inner")
