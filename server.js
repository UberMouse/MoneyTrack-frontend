/**
 * Created by Taylor on 4/09/14.
 */
var webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');
var config = require('./webpack.config');
var request = require('request')
config.output.publicPath = 'http://localhost:3000/' + config.output.publicPath;

var pushStateHook = function (rootUrl) {
  var path = require('path');
  return function (req, res, next) {
    res.setHeader("Access-Control-Allow-Origin", "*")
    var ext = path.extname(req.url);
    if ((ext === '' || ext === '.html') && req.url !== '/') {
      req.pipe(request(rootUrl)).pipe(res);
    } else {
      next();
    }
  };
};

var server = new WebpackDevServer(webpack(config), {
    publicPath: config.output.publicPath,
    hot: true
})

server.listen(3000, 'localhost', function (err, result) {
    if (err) {
        console.log(err);
    }

    console.log('Listening at localhost:3000');
});
server.use(pushStateHook('http://localhost:3000'))
