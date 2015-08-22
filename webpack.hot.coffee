webpack = require 'webpack'
path = require 'path'

module.exports =
  devtool: 'cheap-module-eval-source-map'
  plugins: [
    new webpack.HotModuleReplacementPlugin()
    new webpack.NoErrorsPlugin()
    new webpack.DefinePlugin {__DEV__: true}
  ]
  entry:
    demo: [
      'webpack-dev-server/client?http://0.0.0.0:3000'
      'webpack/hot/only-dev-server'
      './src/index.coffee'
    ]
    test: [
      'webpack-dev-server/client?http://0.0.0.0:3000'
      'webpack/hot/only-dev-server'
      'mocha!./test/index.coffee'
    ]
  output:
    path: path.join(__dirname, 'build-hot')
    publicPath: '/webpack-in-memory/'
    filename: '[name].hot.js'
    chunkFilename: '[id].hot.js'
    libraryTarget: 'var'
    library: 'ReduxCjsxBoilerplate'
  module:
    loaders: [
      { test: /\.coffee$/, loaders: ['react-hot', 'coffee-loader'] }
      { test: /\.cjsx$/, loaders: [ 'react-hot', 'coffee-jsx-loader'] }
      # { test: /\.css$/, loader: 'style!css' }
    ]
  resolve:
    extensions: ['', '.coffee', '.cjsx', '.js']
