// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

displayTree = function() {
  if ($('#tree').length > 0) {
    $('#tree').treeview({
      data: tree,
      levels: 3,
      enableLinks: true,
      onNodeSelected: function(event, data) {
        $("li[data-nodeid*=" + data.nodeId + "] a")[0].click();
      }
    });
  }
};


$(document).ready(displayTree);
$(document).on('turbolinks:load', displayTree);

