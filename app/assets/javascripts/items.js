// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

stockItemSelector = function() {
  $('#item_stock_item_id').select2({
    theme: "bootstrap"
  });
};


$(document).ready(stockItemSelector);
$(document).on('turbolinks:load', stockItemSelector);

