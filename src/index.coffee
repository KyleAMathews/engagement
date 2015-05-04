throttle = require 'lodash.throttle'
events = require 'dom-events'

listeners = []

exports.listen = (fn) ->
  listeners.push fn

active = ->
  for fn in listeners
    fn()

exports.active = throttledActive = throttle active, 5000, leading: true

# Listen to mouse movements.
events.on(window, 'mousemove', (e) ->
  throttledActive()
)

events.on(window, 'click', (e) ->
  throttledActive()
)

# Listen to keyboard presses.
events.on(window, 'keyup', (e) ->
  throttledActive()
)

# Listen for scrolling.
events.on(window, 'scroll', (e) ->
  throttledActive()
)