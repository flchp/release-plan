// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require jquery.autogrow-textarea
//= require bootstrap/dropdown
//= require bootstrap/alert
//= require bootstrap/modal
//= require bootstrap/tooltip
//= require bootstrap-markdown-bundle
//= require dropzone
//= require_self



$('.dp').on('change', function(){
    $('.datepicker').hide();
});

  $('.btn-group button[data-calendar-nav]').each(function() {
    var $this = $(this);
    $this.click(function() {
      calendar.navigate($this.data('calendar-nav'));
    });
  });


$("textarea").autogrow();

$(function() {
  var mediaDropzone;
  mediaDropzone = new Dropzone(".problem-comment-form .new_comment textarea", { clickable: false, url: "/media_contents" });
  return mediaDropzone.on("success", function(file, responseText) {
    var _this = this;
    imageUrl = responseText.file_name.url;
    appendContent(responseText.file_name.url, responseText.id);

  });
});

var appendContent = function(imageUrl, mediaId) {
   var $textArea = $('.problem-comment-form .new_comment textarea');

   $textArea.val($textArea.val() + "\n![](" + imageUrl + ")");
};

