// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Creates stock item selector
stockItemSelector = function() {
  $('#item_stock_item_id').select2({
    theme: "bootstrap"
  });
};

// Create stock item selector on page load
$(document).ready(stockItemSelector);
$(document).on('turbolinks:load', stockItemSelector);

