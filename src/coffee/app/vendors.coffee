define [
  'async'
  'underscore'
  'jquery'
  'backbone'
  'backbone.localStorage'
  'backbone.marionette'
  'backbone.stickit'
  'backbone.nested-attributes'
  'moment'
  'moment-ru'
  'semantic-ui-transition'
  'semantic-ui-dropown'
  'semantic-ui-dimmer'
  'semantic-ui-popup'
], () ->
  window.moment = require('moment')
  moment.locale "ru"
