//= require active_admin/base
//= require fancybox
//= require maskedinput
//= require tinymce
 
$(document).ready(function() {
  tinyMCE.init({
     mode : "specific_textareas",
     editor_selector : "tinymce_editor",
     theme: 'advanced'
   });
});

$(function(){
  $("#taxist_pasport_number").mask("(9999)999999");
  $("#not_checked_taxist_pasport_number").mask("(9999)999999");
  $("#q_pasport_number").mask("(9999)999999");
  $("#not_checked_taxist_vodit_ustov_number").mask("** ** 999999");
  $("#q_vodit_ustov_number").mask("** ** 999999");
  $("#taxist_vodit_ustov_number").mask("** ** 999999");
  $("input").attr('autocomplete', 'off');  

  $("a.fancybox").fancybox();

  if ($("#admin_user_views_count").val() == "-1") {
    $("#unlimit-views").attr('checked','checked');
  }
    
  $("#unlimit-views").click(function(){
    if ($(this).is(':checked')) {
      $("#admin_user_views_count").val("-1");
    } else {
      $("#admin_user_views_count").val("0");
    }
  });
});
