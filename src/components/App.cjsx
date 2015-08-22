{ createStore, compose } = require 'redux'
React = require 'react/addons'
el = React.createElement
{ Provider } = require 'react-redux'
Root = require './Root'
Reducers = require '../reducers/root'

makeStore = () ->
  if __DEV__
    { devTools, persistState } = require 'redux-devtools'
    composedStore = compose(
      devTools(),
      persistState(window.location.href.match(/[?&]debug_session=([^&]+)\b/)),
      createStore
    )
    return composedStore Reducers
  else
    return createStore Reducers

makeDev = (store) ->
  if __DEV__
    { DevTools, DebugPanel, LogMonitor } = require 'redux-devtools/lib/react'
    el DebugPanel, {top:true, right:true, bottom:true, key: 'devtools'},
      el DevTools, {store, monitor: LogMonitor}

module.exports = MountApp = (mountPoint) ->
  store = makeStore()
  view = <div>
      <Provider store={store}>
        {() -> <Root />}
      </Provider>
      {makeDev store}
    </div>
  mounted = React.render view, mountPoint
  return {store, mounted}