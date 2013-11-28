(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['user_add'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<form id=\"user-add-form\">\n  <input type=\"text\" name=\"user[given_name]\" value=\"\">\n  <input type=\"submit\" value=\"Create User\">\n</form>";
  });
})();