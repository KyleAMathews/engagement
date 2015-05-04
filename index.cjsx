React = require('react')

engagement = require '../src'

Activity = React.createClass
  getInitialState: ->
    events: []

  componentDidMount: ->
    engagement.listen =>
      event = new Date().toJSON()
      events = @state.events
      events.push event
      @setState events: events

  render: ->
    events = @state.events.map (event) ->
      <li key={event}>User engagement event at {event}</li>

    <div>
      <h2>Engagement events</h2>
      <ul>{events}</ul>
    </div>


React.render(<Activity />, document.body)
