define [
  'app/app'
  './list/list_controller'
  './new/new_controller'
], (App) ->

  API =
    list: (args...) ->
      new App.Event.List.Controller
        region: App.mainRegion

    show: (args...) ->
      new App.Event.Show.Controller
        region: App.mainRegion

    new: (args...) ->
      new App.Event.New.Controller
        region: App.mainRegion

    edit: (args...) ->
      new App.Event.Edit.Controller
        region: App.mainRegion
