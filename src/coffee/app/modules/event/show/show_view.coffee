define [
  'app/app'
  'base.views'
  'google-platform'
  './templates/layout'
  './templates/header'
  './templates/content'
], () ->
  App = require 'app/app'
  Views = require 'base.views'

  App.module 'Event.Show', (Show, App, Backbone, Mn, $, _) ->

    class Show.Layout extends Views.LayoutView
      template: 'event/show/templates/layout'
      className: 'page-layout'

      regions:
        header: '#header-region'
        content: '#content-region'

    class Show.Header extends Views.ItemView
      template: 'event/show/templates/header'
      className: 'ui basic segment'

    class Show.Content extends Views.ItemView
      template: 'event/show/templates/content'
      className: 'ui tall stacked segment'

      bindings:
        '[name=start_date]':
          observe: 'start_date'

        '[name=title]':
          observe: 'title'

        '[name=description]':
          observe: 'description'

      ui:
        hangoutBtn: '.hangout'

      onRender: ->
        gapi.hangout.render @ui.hangoutBtn[0],
          'render': 'createhangout'
          # 'hangout_type': 'onair'
          'initial_apps': [{'app_id' : '1063424140675', 'app_type' : 'LOCAL_APP' }]
