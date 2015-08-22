{loadItems, addItem, setDone} = require '../../src/actions/ItemActions'
{ LOAD_ITEMS, ADD_ITEM, SET_DONE } = require '../../src/Types'

describe 'ItemActions', ->

  it 'should make "load items" action', ->
    expect( loadItems([{id:0}]) ).to.deep.equal
      type: LOAD_ITEMS
      payload: [{id:0}]

  it 'should make "add item" action', ->
    action = addItem('hello')
    expect( action.type ).to.deep.equal ADD_ITEM
    expect( action.payload.text ).to.equal 'hello'
    expect( action.payload.done ).to.equal false

  it 'should make "set done" action', ->
    expect( setDone(3, false) ).to.deep.equal
      type: SET_DONE
      payload:
        index: 3
        value: false
