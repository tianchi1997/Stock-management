# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = -> $('#tree').treeview({
  data: tree,
  enableLinks: true,
  levels: 3
});

$(document).ready(ready);
$(document).on('turbolinks:load', ready);

