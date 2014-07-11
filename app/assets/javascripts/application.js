//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {
  $('.btn-remove').click(function() {
    $(this).prev("input[type=hidden]").val(true);
    $(this).closest(".field").hide();
    return false;
  });
});


