reducer = require '../../src/reducers/root'

{addItem, setDone} = require '../../src/actions/ItemActions'

describe 'Root Reducer', ->

  state = null

  it 'should generate initial state', ->
    state = reducer undefined, {}
    expect( state ).to.have.all.keys ['ui', 'items']
    expect( state.ui.toJS() ).to.deep.equal {loading: true}
    expect( state.items.toJS() ).to.deep.equal []

  it 'should set loading', ->
    state = reducer state, {type: 'SET_LOADING', payload: false}
    expect( state.ui.toJS() ).to.deep.equal {loading: false}

  it 'should add an item', ->
    state = reducer state, addItem('hello')
    list = state.items.toJS()
    expect( list.length ).to.equal 1
    expect( list[0].done ).to.equal false
    expect( list[0].text ).to.equal 'hello'

  it 'should set an item done', ->
    state = reducer state, setDone(0, true)
    list = state.items.toJS()
    expect( list.length ).to.equal 1
    expect( list[0].done ).to.equal true
    