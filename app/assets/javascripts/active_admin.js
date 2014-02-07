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
});
