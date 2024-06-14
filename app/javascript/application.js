// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Rails functionality
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Import Bootstrap
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'

// Import jQuery and Bootstrap
import $ from 'jquery';
import 'bootstrap';

// Optional: You can also include the Bootstrap CSS if it's not included elsewhere
import 'bootstrap/dist/css/bootstrap.css';

// Ensure jQuery is available globally
global.$ = jQuery;

//= require jquery
//= require rails-ujs
//= require_tree .import "channels"
window.jQuery = $;
window.$ = $;

import "channels"