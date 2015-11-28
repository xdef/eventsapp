define ['app/app'], (App) ->
  App.module "Event", (Event, App, Backbone, Mn, $, _) ->

    class Event.Router extends Mn.AppRouter
      appRoutes:
        "!/event": "list"
        "!/event/new": "new"
        "!/event/:id": "show"
        "!/event/:id/edit": "edit"
        "!/event/.*": "list"

    API =
      list: (args...) ->
        require ['app/modules/event/event_api'], (Actions) ->
          Actions.list(args...)

      show: (args...) ->
        require ['app/modules/event/event_api'], (Actions) ->
          Actions.show(args...)

      new: (args...) ->
        require ['app/modules/event/event_api'], (Actions) ->
          Actions.new(args...)

      edit: (args...) ->
        require ['app/modules/event/event_api'], (Actions) ->
          Actions.edit(args...)

    Event.on "start", (options = {}) ->
      new Event.Router
        controller: API
