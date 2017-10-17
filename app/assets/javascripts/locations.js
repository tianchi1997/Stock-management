// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Displays location tree
displayTree = function() {
  if ($('#tree').length > 0) {
    $('#tree').treeview({
      data: tree,
      levels: 3,
      enableLinks: true,
      onNodeSelected: function(event, data) {
        // Simulate click on location URL when node clicked on
        $("li[data-nodeid*=" + data.nodeId + "] a")[0].click();
      }
    });
  }
};

// Display location tree on page load
$(document).ready(displayTree);
$(document).on('turbolinks:load', displayTree);

