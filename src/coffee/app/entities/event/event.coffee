define ['app/app', 'base.entities'], (App, Entities) ->

  App.module "Entities", (Entities, App, Backbone, Mn, $, _) ->

    class Entities.Event extends Entities.Model

      localStorage: new Backbone.LocalStorage("Eventes")

      defaults:
        title: 'Встреча 1'
        start_date: moment().toISOString()

    class Entities.EventsCollection extends Entities.Collection
      model: Entities.Event
      localStorage: new Backbone.LocalStorage("Eventes")

    API =
      getEvents: ->
        @events ||= new Entities.EventsCollection
        @events.fetch()
        @events

      newEvent: (attrs = {}) ->
        events = App.reqres.request 'event:entities'
        new events.model attrs

      saveEvent: (model, options = {}) ->
        options = _.defaults options,
          success: (model, response, options) ->
            App.navigate '/event', trigger: true

        events = App.reqres.request 'event:entities'
        events.create model, options


    App.reqres.setHandler 'event:entities', (args...) ->
      API.getEvents args...

    App.reqres.setHandler 'event:entity:new', (args...) ->
      API.newEvent args...

    App.commands.setHandler 'event:save', (args...) ->
      API.saveEvent args...
