/**
 * Created by Taylor on 4/09/14.
 */
var webpack = require('webpack');
var path = require('path');

module.exports = {
    entry: [
        'webpack-dev-server/client?http://localhost:3000',
        'webpack/hot/only-dev-server',
        './javascripts/boot.coffee'
    ],
    devtool: "eval",
    output: {
        path: __dirname,
        filename: 'bundle.js',
        publicPath: ''
    },
    resolve: {
        // Allow to omit extensions when requiring these files
        extensions: ['', '.js', '.jsx', '.coffee', '.cjsx'] ,
        root: [path.join(__dirname, 'javascripts'), path.join(__dirname, 'styles')]
    },
    module: {
        loaders: [
            { test: /\.coffee$/, loaders: ['react-hot', 'coffee']},
            { test: /\.scss$/, exclude: /\.useable.scss$/, loaders: ['style', 'css', 'sass']},
            { test: /\.useable.scss$/, loaders: ['style/useable', 'css', 'sass']},
            { test: /\.css$/, loaders: ['style/useable', 'css']}
        ]
    },
    plugins: [
        new webpack.HotModuleReplacementPlugin()
    ]
};
