React = require 'react/addons'
TestUtils = React.addons.TestUtils

Item = require '../../src/components/Item'

describe 'Item', ->

  mountPoint = null
  emitEvent = null
  mounted = null

  getProps = ->
    index: 0
    done: false
    id: '000'
    text: 'item 0'
    onSetDone: null

  beforeEach ->
    mountPoint = document.getElementById 'test-container'
    props = getProps()
    emitEvent = sinon.stub()
    props.onSetDone = emitEvent
    component = <Item {...props} />
    mounted = React.render component, mountPoint

  afterEach ->
    React.unmountComponentAtNode mountPoint

  describe 'component structure', ->

    it 'should have text', ->
      el = React.findDOMNode mounted
      expect( el.textContent ).to.equal 'item 0'

    it 'should not be line-through', ->
      el = React.findDOMNode mounted
      expect( el.style.textDecoration ).to.equal 'none'

    describe 'setting done', ->

      beforeEach ->
        mounted.setProps {done: true}

      it 'should be line-through', ->
        el = React.findDOMNode mounted
        expect( el.style.textDecoration ).to.equal 'line-through'

  describe 'interaction', ->

    describe 'clicking item', ->

      beforeEach ->
        el = React.findDOMNode mounted 
        TestUtils.Simulate.click el 

      it 'should call passed-in function', ->
        expect(emitEvent.callCount).to.equal 1

      it 'should have proper arguments', ->
        expect(emitEvent.firstCall.args).to.deep.equal [0, true]
