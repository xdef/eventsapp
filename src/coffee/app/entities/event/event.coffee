define ['app/app', 'base.entities'], (App, Entities) ->

  App.module "Entities", (Entities, App, Backbone, Mn, $, _) ->

    class Entities.Event extends Entities.Model

      localStorage: new Backbone.LocalStorage("Eventes")

      defaults:
        start_date: moment().toISOString()

    class Entities.EventsCollection extends Entities.Collection
      model: Entities.Event
      localStorage: new Backbone.LocalStorage("Eventes")

    API =
      getEvents: ->
        @events ||= (
          events = new Entities.EventsCollection
          events.fetch()
          events
        )

      getEvent: (id) ->
        events = App.reqres.request 'event:entities'
        events.get id

      newEvent: (attrs = {}) ->
        events = App.reqres.request 'event:entities'
        new events.model attrs

      saveEvent: (model, options = {}) ->
        options = _.defaults options,
          success: (model, response, options) =>
            @events.add(model) if @events
            App.navigate '/event', trigger: true

        events = App.reqres.request 'event:entities'
        events.create model, options

      destroyEvent: (model) ->
        model.destroy()


    App.reqres.setHandler 'event:entities', (args...) ->
      API.getEvents args...

    App.reqres.setHandler 'event:entity', (args...) ->
      API.getEvent args...

    App.reqres.setHandler 'event:entity:new', (args...) ->
      API.newEvent args...

    App.commands.setHandler 'event:save', (args...) ->
      API.saveEvent args...

    App.commands.setHandler 'event:destroy', (args...) ->
      API.destroyEvent args...
