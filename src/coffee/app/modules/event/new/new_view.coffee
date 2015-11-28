define [
  'app/app'
  'base.views'
  'bindings.datepicker'
  './templates/layout'
  './templates/header'
  './templates/form'
], () ->
  App = require 'app/app'
  Views = require 'base.views'

  App.module 'Event.New', (New, App, Backbone, Mn, $, _) ->

    class New.Layout extends Views.LayoutView
      template: 'event/new/templates/layout'
      className: 'page-layout'

      regions:
        header: '#header-region'
        form: '#form-region'

    class New.Header extends Views.ItemView
      template: 'event/new/templates/header'
      className: 'ui basic segment'

    class New.Form extends Views.ItemView
      template: 'event/new/templates/form'
      tagName: 'form'
      className: 'ui form'

      bindings:
        '[name=start_date]':
          observe: 'start_date'

        '[name=title]':
          observe: 'title'

        '[name=description]':
          observe: 'description'

      triggers:
        'submit': 'submit'
