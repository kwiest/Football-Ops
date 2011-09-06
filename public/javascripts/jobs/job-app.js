/* DO NOT MODIFY. This file was compiled Wed, 24 Aug 2011 16:44:55 GMT from
 * /Users/kwiest2000/Sites/Football-Ops/app/coffeescripts/jobs/job-app.coffee
 */

(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.Router = (function() {
    __extends(Router, Backbone.Router);
    function Router() {
      this.showJob = __bind(this.showJob, this);
      this.home = __bind(this.home, this);
      Router.__super__.constructor.apply(this, arguments);
    }
    Router.prototype.initialize = function(options) {
      this.jobs = new JobList(options.list);
      return this.jobListView = new JobListView({
        collection: this.jobs
      });
    };
    Router.prototype.routes = {
      "": "home",
      "show/:id": "showJob"
    };
    Router.prototype.home = function() {
      $("#show-job").empty();
      return this.jobListView.render();
    };
    Router.prototype.showJob = function(id) {
      var job, view;
      $("#jobs").empty();
      job = this.jobs.get(id);
      view = new JobShowView({
        model: job
      });
      return view.render();
    };
    return Router;
  })();
}).call(this);
