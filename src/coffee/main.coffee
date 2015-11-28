requirejs.config
  urlArgs: "rev=0.0.1"
  baseUrl: 'js'

  shim:
    'semantic-ui-accordion':  deps: ['jquery'], exports: '$'
    'semantic-ui-ad':         deps: ['jquery'], exports: '$'
    'semantic-ui-checkbox':   deps: ['jquery'], exports: '$'
    'semantic-ui-colorize':   deps: ['jquery'], exports: '$'
    'semantic-ui-embed':      deps: ['jquery'], exports: '$'
    'semantic-ui-form':       deps: ['jquery'], exports: '$'
    'semantic-ui-nag':        deps: ['jquery'], exports: '$'
    'semantic-ui-progress':   deps: ['jquery'], exports: '$'
    'semantic-ui-rating':     deps: ['jquery'], exports: '$'
    'semantic-ui-search':     deps: ['jquery'], exports: '$'
    'semantic-ui-shape':      deps: ['jquery'], exports: '$'
    'semantic-ui-state':      deps: ['jquery'], exports: '$'
    'semantic-ui-sticky':     deps: ['jquery'], exports: '$'
    'semantic-ui-tab':        deps: ['jquery'], exports: '$'
    'semantic-ui-visibility': deps: ['jquery'], exports: '$'
    'semantic-ui-visit':      deps: ['jquery'], exports: '$'
    'semantic-ui-video':      deps: ['jquery'], exports: '$'
    'semantic-ui-dropown':    deps: ['jquery'], exports: '$'
    'semantic-ui-dimmer':     deps: ['jquery'], exports: '$'
    'semantic-ui-sidebar':    deps: ['jquery'], exports: '$'
    'semantic-ui-popup':      deps: ['jquery'], exports: '$'
    'semantic-ui-modal':      deps: ['jquery'], exports: '$'
    'semantic-ui-api':        deps: ['jquery'], exports: '$'
    'semantic-ui-transition': deps: ['jquery'], exports: '$'

    'backbone.nested-attributes': deps: ['backbone'], exports: 'Backbone'
    'moment-duration-format':     deps: ['moment']

  paths:
    'async':                      '../components/requirejs-plugins/src/async'
    'underscore':                 '../components/underscore/underscore'
    'backbone':                   '../components/backbone/backbone'
    'backbone.marionette':        '../components/backbone.marionette/lib/backbone.marionette'
    'backbone.stickit':           '../components/backbone.stickit/backbone.stickit'
    'backbone.sync':              'lib/backbone/backbone-rails-sync'
    'backbone.nested-attributes': 'lib/backbone/backbone-nested-attributes'
    'backbone.localStorage':      '../components/backbone.localStorage/backbone.localStorage'
    'jquery':                     '../components/jquery/dist/jquery'
    'jquery-deparam':             '../components/jquery-deparam/jquery-deparam'
    'js-cookie':                  '../components/js-cookie/src/js.cookie'
    'domReady':                   '../components/requirejs-domready/domReady'
    'modernizr':                  '../components/modernizr/modernizr'
    'google-maps':                'https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyAE3YYOa-ZEYZ624wF5SFtEjTcwEyIvmcs&libraries=places'
    'google-client':              'https://apis.google.com/js/client'
    'google-platform':            'https://apis.google.com/js/platform'
    'moment':                     '../components/moment/moment'
    'moment-ru':                  '../components/moment/locale/ru'
    'moment-duration-format':     '../components/moment-duration-format/lib/moment-duration-format'
    'nprogress':                  '../components/nprogress/nprogress'
    'jquery.inputmask':           '../components/jquery.inputmask/dist/jquery.inputmask.bundle'
    'pikaday':                    '../components/pikaday/pikaday'
    'routes':                     'routes/routes'

    'semantic-ui-accordion':  '../components/semantic/dist/components/accordion'
    'semantic-ui-ad':         '../components/semantic/dist/components/ad'
    'semantic-ui-checkbox':   '../components/semantic/dist/components/checkbox'
    'semantic-ui-colorize':   '../components/semantic/dist/components/colorize'
    'semantic-ui-embed':      '../components/semantic/dist/components/embed'
    'semantic-ui-form':       '../components/semantic/dist/components/form'
    'semantic-ui-nag':        '../components/semantic/dist/components/nag'
    'semantic-ui-progress':   '../components/semantic/dist/components/progress'
    'semantic-ui-rating':     '../components/semantic/dist/components/rating'
    'semantic-ui-search':     '../components/semantic/dist/components/search'
    'semantic-ui-shape':      '../components/semantic/dist/components/shape'
    'semantic-ui-state':      '../components/semantic/dist/components/state'
    'semantic-ui-sticky':     '../components/semantic/dist/components/sticky'
    'semantic-ui-tab':        '../components/semantic/dist/components/tab'
    'semantic-ui-visibility': '../components/semantic/dist/components/visibility'
    'semantic-ui-visit':      '../components/semantic/dist/components/visit'
    'semantic-ui-video':      '../components/semantic/dist/components/video'
    'semantic-ui-dropown':    '../components/semantic/dist/components/dropdown'
    'semantic-ui-dimmer':     '../components/semantic/dist/components/dimmer'
    'semantic-ui-sidebar':    '../components/semantic/dist/components/sidebar'
    'semantic-ui-popup':      '../components/semantic/dist/components/popup'
    'semantic-ui-modal':      '../components/semantic/dist/components/modal'
    'semantic-ui-api':        '../components/semantic/dist/components/api'
    'semantic-ui-transition': '../components/semantic/dist/components/transition'

    'bindings.uploader':                  'app/base/bindings/uploader'
    'bindings.remote-multiple-dropdown':  'app/base/bindings/remote_multiple_dropdown'
    'bindings.numeric-input':             'app/base/bindings/inputmask'
    'bindings.datepicker':                'app/base/bindings/datepicker'
    'bindings.date-range-picker':         'app/base/bindings/date_range_picker'
    'bindings.address':                   'app/base/bindings/address'

  packages: [
    'base.config',      { name: 'base.config',      location: 'app/config' }
    'base.entities',    { name: 'base.entities',    location: 'app/base/entities' }
    'base.controllers', { name: 'base.controllers', location: 'app/base/controllers' }
    'base.views',       { name: 'base.views',       location: 'app/base/views' }
    'entities',         { name: 'entities',         location: 'app/entities' }
    'event',            { name: 'event',            location: 'app/modules/event' }
  ]

  modules: [
    {
      name: 'app/modules/pages/pages_api'
      exclude: ['app/app', 'app/vendors', 'base.entities', 'base.views', 'base.controllers']
    }, {
      name: 'main'
      include: [
        'app/vendors', 'app/app', 'base.entities', 'base.views', 'base.controllers', 'base.config',
        'entities'
      ]
      exclude: [
        'app/modules/pages/pages_api'
      ]
    }
  ]

require ['app/vendors'], ->

  require [
    'app/app', 'base.entities', 'base.views', 'base.controllers', 'base.config'
    'entities', 'event'
  ], ->

    App = require 'app/app'
    options = require 'base.config'

    $(document).ready ->
      # Start main application
      App.start options
