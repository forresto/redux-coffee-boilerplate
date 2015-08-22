webpack = require 'webpack'
path = require 'path'

BUILD = process.env.BUILD or 'dist'

getCommonConfig = ->
  plugins: [ 
    new webpack.DefinePlugin
      __DEV__: (BUILD is 'dev')
  ]
  output:
    path: path.join(__dirname, 'build')
    libraryTarget: 'var'
    library: 'ReduxCjsxBoilerplate'
  module: 
    loaders: [
      { test: /\.coffee$/, loader: 'coffee-loader' }
      { test: /\.cjsx$/, loader: 'coffee-jsx-loader' }
    ]
  resolve:
    extensions: ['', '.coffee', '.cjsx', '.js']
  externals:
    'react': 'React'
    'react/addons': 'React'

getConfig = ->
  config = getCommonConfig()
  switch BUILD
    when 'test'
      config.entry = './test/index'
      config.output.filename = 'test.js'
    when 'dev'
      config.entry = './src/index'
      config.output.filename = 'dev.js'
    when 'dist'
      config.entry = './src/index'
      config.output.filename = 'dist.js'
      config.plugins.push new webpack.optimize.UglifyJsPlugin()
  return config

module.exports = getConfig()