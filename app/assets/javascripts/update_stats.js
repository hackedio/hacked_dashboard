// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  initializeButtons();
});

function initializeButtons(){
  $('button').click(function(){
    var statid = $(this).data('statid');
    var url = "/stats/"+statid;
    $.ajax({
      type: "PUT",
      data:'increment=true',
      url: url,
      success: function(response){
        console.log(response);
      }
    });
  });
}
