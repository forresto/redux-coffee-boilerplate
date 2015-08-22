{ LOAD_ITEMS, ADD_ITEM, SET_TEXT, SET_DONE } = require '../Types'

pseudoId = ->
  Math.floor(Math.random()*999999999).toString(36)

module.exports = ItemActions =
  loadItems: (items) ->
    type: LOAD_ITEMS
    payload: items
  addItem: (text) ->
    type: ADD_ITEM
    payload:
      text: text
      id: pseudoId()
      done: false
  setDone: (index, value) ->
    type: SET_DONE
    payload: {index, value}
  setText: (index, text) ->
    type: SET_TEXT
    payload: {index, text}
