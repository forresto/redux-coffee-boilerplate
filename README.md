# redux-coffee-boilerplate [![Build Status](https://travis-ci.org/forresto/redux-coffee-boilerplate.svg)](https://travis-ci.org/forresto/redux-coffee-boilerplate)

Get started with React + Redux + Immutable.js + CoffeeScript + Mocha + webpack

## concepts

* Action types are defined in src/Types.coffee
* Action generators for convenience are defined in src/actions/
* To trigger an action, call state.dispatch(action)
* Only src/components/Root.cjsx deals with Redux and Immutable
  * The rest of the components should only deal with props
* Everything that mutates state must happen in src/reducers/
* The shape of the state is defined in the reducers

## develop

`npm start`, then open 

* http://localhost:3000/dev/index.html for the demo / monkey testing
* http://localhost:3000/dev/test.html for Mocha running

Changes should hot-reload on save. Compile errors go to browser console. 

redux-devtools will render dispatched actions as a list that you can step through and toggle.

## build

`npm run build`

* /demo/index.html is the static-built demo
* /test/runner.html is the static-built test runner

## uses

* React
* CoffeeScript + jsx = cjsx
* [Redux](http://rackt.github.io/redux/) + [redux-devtools](https://github.com/gaearon/redux-devtools)
* webpack + [react-hot-loader](http://gaearon.github.io/react-hot-loader/)
* Immutable.js
* Mocha + Chai