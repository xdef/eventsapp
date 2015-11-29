define [
  'app/app'
  'base.views'
  './templates/layout'
  './templates/header'
  './templates/item'
], () ->
  App = require 'app/app'
  Views = require 'base.views'

  App.module 'Event.List', (List, App, Backbone, Mn, $, _) ->

    class List.Layout extends Views.LayoutView
      template: 'event/list/templates/layout'
      className: 'page-layout'

      regions:
        header: '#header-region'
        events: '#events-region'

    class List.Header extends Views.ItemView
      template: 'event/list/templates/header'
      className: 'ui basic segment'

    class List.Event extends Views.ItemView
      template: 'event/list/templates/item'
      className: 'ui green clearing segment'

      ui:
        destroyBtn: '.destroy'

      triggers:
        'click @ui.destroyBtn': 'delete'

      # onRender: ->
      #   gapi.hangout.render @ui.hangoutBtn[0],
      #     'render': 'createhangout'
      #     # 'hangout_type': 'onair'
      #     'initial_apps': [{'app_id' : '1063424140675', 'app_type' : 'LOCAL_APP' }]

    class List.Events extends Views.CollectionView
      className: 'ten wide column'

      childView: List.Event
      childViewEventPrefix: 'event'
