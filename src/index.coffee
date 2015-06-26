throttle = require 'lodash.throttle'
events = require '@kylemathews/dom-events'

listeners = []

exports.listen = (fn) ->
  listeners.push fn

active = ->
  for fn in listeners
    fn()

exports.active = throttledActive = throttle active, 5000, leading: true

if typeof window isnt "undefined"
  # Listen to mouse movements.
  events.on(window, 'mousemove', (e) ->
    throttledActive()
  )

  # Listen to touchstart events
  events.on(window, 'touchstart', (e) ->
    throttledActive()
  )

  # Listen to touchmove events
  events.on(window, 'touchmove', (e) ->
    throttledActive()
  )

  # Listen to clicks.
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
