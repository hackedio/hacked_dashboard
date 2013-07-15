// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  initializeForm();
});

function initializeForm(){
  $('#submit_video').click(function(){
    var videoid = $('#videoid').val();
    var author = $('#author').val();
    var videourl = "http://www.youtube.com/embed/"+videoid+"?autoplay=1&loop=1&playlist="+videoid+"&showinfo=0&controls=0"
    postVideo(videoid,author,videourl);
    $('body').html('video submitted');
    return false;
  });
}

function postVideo(videoid,author,videourl){
  var url = '/youtube_videos';
  var datenow = new Date();
  $.ajax({
    type: "POST",
    dataType: 'JSON',
    url: url,
    // data: "youtube_video[videoid]="+videoid+"&youtube_video[videourl]="+videourl+"&youtube_video[authorname]="+author+"&youtube_video[dateuploaded]="+datenow,
    data: {youtube_video:{videoid:videoid,videourl:videourl,authorname:author,dateuploaded:datenow}},
    success: function(response){
      console.log(response);
    }
  });
}