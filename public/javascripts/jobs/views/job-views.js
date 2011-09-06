/* DO NOT MODIFY. This file was compiled Wed, 24 Aug 2011 16:44:55 GMT from
 * /Users/kwiest2000/Sites/Football-Ops/app/coffeescripts/jobs/views/job-views.coffee
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
  window.JobShowView = (function() {
    __extends(JobShowView, Backbone.View);
    function JobShowView() {
      this.close = __bind(this.close, this);
      this.render = __bind(this.render, this);
      JobShowView.__super__.constructor.apply(this, arguments);
    }
    JobShowView.prototype.el = "#show-job";
    JobShowView.prototype.events = {
      "click .close": "close"
    };
    JobShowView.prototype.render = function() {
      $(this.el).html(JST.show(this.model.toJSON()));
      return this;
    };
    JobShowView.prototype.close = function() {
      $(this.el).empty();
      router.navigate("", true);
      return false;
    };
    return JobShowView;
  })();
  window.JobListView = (function() {
    __extends(JobListView, Backbone.View);
    function JobListView() {
      this.render = __bind(this.render, this);
      JobListView.__super__.constructor.apply(this, arguments);
    }
    JobListView.prototype.el = "#jobs";
    JobListView.prototype.initialize = function() {
      this.collection.bind("add", this.render);
      return this.collection.bind("remove", this.render);
    };
    JobListView.prototype.render = function() {
      var els;
      $(this.el).empty();
      els = this.collection.map(function(job) {
        var view;
        view = new JobListItemView({
          model: job
        });
        return view.render().el;
      });
      $(this.el).append(els);
      return this;
    };
    return JobListView;
  })();
  window.JobListItemView = (function() {
    __extends(JobListItemView, Backbone.View);
    function JobListItemView() {
      this.show = __bind(this.show, this);
      this.render = __bind(this.render, this);
      JobListItemView.__super__.constructor.apply(this, arguments);
    }
    JobListItemView.prototype.tagName = "li";
    JobListItemView.prototype.className = "job";
    JobListItemView.prototype.events = {
      "click .show-job": "show"
    };
    JobListItemView.prototype.initialize = function() {
      return this.model.bind("change", this.render);
    };
    JobListItemView.prototype.render = function() {
      $(this.el).html(JST.list_item(this.model.toJSON()));
      return this;
    };
    JobListItemView.prototype.show = function() {
      router.navigate("show/" + (this.model.get('id')), true);
      return false;
    };
    return JobListItemView;
  })();
}).call(this);
