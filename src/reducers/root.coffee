{ combineReducers } = require 'redux'
ui = require './ui'
items = require './items'

module.exports = combineReducers {ui, items}