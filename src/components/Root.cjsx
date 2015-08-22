React = require 'react/addons'
{ connect } = require 'react-redux'
Item = require './Item'
{addItem, setDone} = require '../actions/ItemActions'

Root = React.createClass
  onAddItem: (event) ->
    {dispatch} = @props
    event.preventDefault()
    add = @refs.add.getDOMNode()
    dispatch addItem add.value
    add.value = ''
  render: ->
    {dispatch, ui, items} = @props

    itemViews = items.map (item, index) ->
      onSetDone = do (index) ->
        (index, done) -> dispatch setDone index, done
      props = {index, onSetDone, key: item.id, text: item.text, done: item.done}
      <Item {...props} />

    loadingProps =
      style:
        display: if ui.loading then 'block' else 'none'

    return <div>
      <div {...loadingProps}>
        Loading...
      </div>
      <ul>
        {itemViews}
      </ul>
      <form onSubmit={@onAddItem}>
        <input ref='add' type='text'></input>
        <button type='submit'>add</button>
      </form>
    </div>

select = (state) -> state
module.exports = connect(select)(Root)