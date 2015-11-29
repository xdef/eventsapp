define ["app/app", "base.controllers", "./list_view"], (App)->

  App.module "Event.List", (List, App, Backbone, Mn, $, _) ->

    class List.Controller extends App.Controllers.Base
      initialize: (options) ->
        { @region } = options
        @layout = @getLayoutView()

        events = App.reqres.request 'event:entities'
        @layout.on "before:show", =>
          @getHeaderRegion()
          @getListRegion events

        @region.show @layout

      getLayoutView: ->
        new List.Layout

      getHeaderRegion: ->
        view = new List.Header
        @layout.showChildView 'header', view

      getListRegion: (events) ->
        view = new List.Events
          collection: events

        view.on 'event:delete', (args) ->
          { model, collection, view } = args
          App.commands.execute 'event:destroy', model

        @layout.showChildView 'events', view

  App.Event.List.Controller
