React = require 'react/addons'

module.exports = Item = React.createClass
  render: ->
    {index, id, text, done, onSetDone} = @props

    props =
      className: 'item'
      key: id
      style:
        textDecoration: if done then 'line-through' else 'none'
      onClick: ->
        onSetDone index, not done
    
    return <li {...props}>{text}</li>