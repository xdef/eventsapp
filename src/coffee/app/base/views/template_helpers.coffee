define [
  "app/app",
  './view'
], (App) ->

  App.module "Views", (Views, App, Backbone, Mn, $, _) ->

    Mn.Renderer.templateHelpers =

      t: (args...) ->
        App.reqres.request 'i18n:t', args...

      signed_in: ->
        App.reqres.request 'user:signed:in?'

      trunc: (str, n) ->
        if str and str.length > n
          str.substr(0, n-1) + ' ...'
        else
          str

      formatedDate: (date, format='LLL') ->
        moment(date).format(format)

      formatedDuration: (duration) ->
        moment
          .duration(duration*1000)
          .format("mm:ss", { forceLength: true, trim: false })

      formatedCost: (cost, currency = 'USD') ->
        icon = switch currency.toLowerCase()
          when 'usd' then '<i class="dollar icon"></i>'
          when 'rub' then '<i class="ruble icon"></i>'

        "#{cost}#{icon}"

      randomStr: (n) ->
        text = ""
        possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

        for i in [0 .. n]
          text += possible.charAt(Math.floor(Math.random() * possible.length))
