# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = -> $('#tree').treeview({
  data: tree,
  levels: 3,
  enableLinks: true,
  onNodeSelected: (event, data) ->
    $("li[data-nodeid*=" + data.nodeId + "] a")[0].click();
});

$(document).ready(ready);
$(document).on('turbolinks:load', ready);

