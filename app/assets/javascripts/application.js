//= require jquery
//= require jquery_ujs
//= require modernizr-1.6.min
//= require twitter/bootstrap
//= require_self

// Batman.js and its adapters
//= require batman/es5-shim
//= require batman/batman
//= require batman/batman.jquery
//= require batman/batman.rails

//= require football_ops

//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./helpers


//= require_tree .
// Run the Batman app
$(document).ready(function(){
  FootballOps.run();
});

