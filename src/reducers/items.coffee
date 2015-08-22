{LOAD_ITEMS, ADD_ITEM, SET_DONE, SET_TEXT} = require '../Types'
Immutable = require 'immutable'

Item = Immutable.Record
  id: ''
  text: ''
  done: false

makeList = (js) ->
  array = (new Item item for item in js)
  return Immutable.List array

module.exports = items = (state=makeList([]), action) ->
  switch action.type
    when LOAD_ITEMS
      state = makeList action.payload
    when ADD_ITEM
      state = state.push new Item action.payload
    when SET_TEXT
      state = state.setIn [action.payload.index, 'text'], action.payload.value
    when SET_DONE
      state = state.setIn [action.payload.index, 'done'], action.payload.value

  return state
