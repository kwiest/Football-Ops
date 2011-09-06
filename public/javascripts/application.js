/* DO NOT MODIFY. This file was compiled Wed, 24 Aug 2011 16:44:55 GMT from
 * /Users/kwiest2000/Sites/Football-Ops/app/coffeescripts/application.coffee
 */

(function() {
  $(function() {
    $("body").bind("click", function(e) {
      return $("a.menu").parent("li").removeClass("open");
    });
    return $("a.menu").click(function(e) {
      $(this).parent("li").toggleClass("open");
      return false;
    });
  });
}).call(this);
