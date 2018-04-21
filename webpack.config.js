const path = require('path');

module.exports = {
  entry: './hackust/js/main.jsx',
  output: {
    path: path.join(__dirname, '/hackust/static/js/'),
    filename: 'bundle.js',
  },
  module: {
    loaders: [
    {
      // Test for js or jsx files
      test: /\.jsx?$/,
      loader: 'babel-loader',
      query: {
        // Convert ES6 syntax to ES5 for browser compatibility
        presets: ['es2015', 'react'],
      },
    },
    ],
  },
  resolve: {
    extensions: ['.js', '.jsx'],
  },
};
