/* DO NOT MODIFY. This file was compiled Wed, 24 Aug 2011 16:44:55 GMT from
 * /Users/kwiest2000/Sites/Football-Ops/app/coffeescripts/jobs/models/job.coffee
 */

(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.User = (function() {
    __extends(User, Backbone.Model);
    function User() {
      User.__super__.constructor.apply(this, arguments);
    }
    return User;
  })();
  window.Job = (function() {
    __extends(Job, Backbone.Model);
    function Job() {
      Job.__super__.constructor.apply(this, arguments);
    }
    Job.prototype.can_user_edit = function(user) {
      return this.attributes.user_id === user.id;
    };
    return Job;
  })();
  window.JobList = (function() {
    __extends(JobList, Backbone.Collection);
    function JobList() {
      JobList.__super__.constructor.apply(this, arguments);
    }
    JobList.prototype.url = "/jobs";
    JobList.prototype.model = Job;
    JobList.prototype.comparator = function(job) {
      return job.get("created_at");
    };
    return JobList;
  })();
}).call(this);
