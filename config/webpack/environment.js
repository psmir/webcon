const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
/**
 * Automatically load modules instead of having to import or require them everywhere.
 * Support by webpack. To get more information:
 *
 * https://webpack.js.org/plugins/provide-plugin/
 * http://j.mp/2JzG1Dm
 */

 // Make JQuery globally available
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default']
  })
);

// resolve-url-loader must be used before sass-loader
environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader',
  options: {
    attempts: 1
  }
});

module.exports = environment
