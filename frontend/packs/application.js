/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

// CSS
import '../stylesheets/application.css.scss'

// JS
import "babel-polyfill";
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import 'bootstrap';
import '@fortawesome/fontawesome-free/js/all';
import 'bootstrap-fileinput';
import 'bootstrap-fileinput/themes/fa/theme.min';
import '../src/global.js';
import '../components/index.js';

// images
require.context('../images/', true, /\.(gif|jpg|png|svg)$/i);
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

window.$ = window.jQuery = require('jquery');
window.Popper = require('popper.js').default; 
const application = Application.start()
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))
Rails.start();
Turbolinks.start();
