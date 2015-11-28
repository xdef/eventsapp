define ["app/app", "base.controllers", "./new_view"], (App)->

  App.module "Event.New", (New, App, Backbone, Mn, $, _) ->

    class New.Controller extends App.Controllers.Base
      initialize: (options) ->
        { @region } = options
        @layout = @getLayoutView()

        event = App.reqres.request 'event:entity:new'
        @layout.on "before:show", =>
          @getHeaderRegion()
          @getFormRegion event

        @region.show @layout

      getLayoutView: ->
        new New.Layout

      getHeaderRegion: ->
        view = new New.Header
        @layout.showChildView 'header', view

      getFormRegion: (event) ->
        view = new New.Form
          model: event

        view.on 'submit', (args) ->
          { model, collection, view } = args
          App.commands.execute 'event:save', model

        @layout.showChildView 'form', view

  App.Event.New.Controller
