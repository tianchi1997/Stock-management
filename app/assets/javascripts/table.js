// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Makes rows with class clickable-row clickable
makeRowClickable = function() {
  if ($('.clickable-row').length > 0) {
    $(".clickable-row").click(function() {
      window.location = $(this).data("url");
    });
  }
}

// Make rows clickable on page load
$(document).ready(makeRowClickable);
$(document).on('turbolinks:load', makeRowClickable);
