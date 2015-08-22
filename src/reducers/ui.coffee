{SET_LOADING} = require '../Types'
Immutable = require 'immutable'

UI = Immutable.Record
  loading: true

makeInitialState = (obj) ->
  return new UI(obj)

module.exports = ui = (state=makeInitialState({}), action) ->
  switch action.type
    when SET_LOADING
      state = state.set 'loading', action.payload

  return state