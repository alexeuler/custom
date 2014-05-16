window.App||={}
$ ->
  App.materials = []
  App.builder = new App.Builder
  App.builder.update_all()
  App.material = new App.Material