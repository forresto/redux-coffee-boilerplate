var webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');
require('coffee-script/register');
var config = require('./webpack.hot.coffee');

new WebpackDevServer( webpack(config), {
  publicPath: config.output.publicPath,
  hot: true,
  historyApiFallback: true
})
.listen(3000, 'localhost', function (err, result) {
  if (err) {
    console.log(err);
  }
  console.log('Listening at localhost:3000');
});