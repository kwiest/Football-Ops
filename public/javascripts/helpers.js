/* DO NOT MODIFY. This file was compiled Wed, 24 Aug 2011 16:44:55 GMT from
 * /Users/kwiest2000/Sites/Football-Ops/app/coffeescripts/helpers.coffee
 */

(function() {
  FootballOpsApp.template = function(selector) {
    var template;
    template = null;
    return function() {
            if (template != null) {
        template;
      } else {
        template = Handlebars.compile(selector.charAt(0) === '#' ? $(selector).html() : selector);
      };
      return template.apply(this, arguments);
    };
  };
}).call(this);
