// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

makeRowClickable = function() {
  if ($('.clickable-row').length > 0) {
    $(".clickable-row").click(function() {
      window.location = $(this).data("url");
    });
  }
}

$(document).ready(makeRowClickable);
$(document).on('turbolinks:load', makeRowClickable);
