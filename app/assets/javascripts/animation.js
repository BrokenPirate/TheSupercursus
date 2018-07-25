$(function() {
  $(".reply_btn").click(function() {
    $(this).parent().parent().children('.reply-form').show();
  });
  $(".cancel_btn").click(function() {
    $(this).parent().parent().hide();
  });
});