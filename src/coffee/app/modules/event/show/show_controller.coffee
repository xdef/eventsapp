define ["app/app", "base.controllers", "./show_view"], (App)->

  App.module "Event.Show", (Show, App, Backbone, Mn, $, _) ->

    class Show.Controller extends App.Controllers.Base
      initialize: (options) ->
        { id, @region } = options
        @layout = @getLayoutView()

        event = App.reqres.request 'event:entity', id
        @layout.on "before:show", =>
          @getHeaderRegion()
          @getContentRegion event

        @region.show @layout

      getLayoutView: ->
        new Show.Layout

      getHeaderRegion: ->
        view = new Show.Header
        @layout.showChildView 'header', view

      getContentRegion: (event) ->
        view = new Show.Content
          model: event

        @layout.showChildView 'content', view

  App.Event.Show.Controller
