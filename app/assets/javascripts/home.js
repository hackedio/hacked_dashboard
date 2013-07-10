// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  getAllTweets();
});

function getAllTweets(){
  var url = "/tweets.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(tweets){
      processTweets(tweets);
    }
  });
}

function processTweets(tweets){
  $.each(tweets, function(index, tweet){

    $('#tweets').append(
        ' <article class="text tweet"> \
            '+tweetTimeElement(tweet['tweeted_at'])+' \
            <img src=\"'+tweet['profile_image_url']+'\" /> \
            <h5><b>'+tweet['name']+'</b> @'+tweet['screen_name']+'</h5> \
            <blockquote>'+tweet['tweet_text']+'</blockquote> \
          </article> '
    );

  });
}

function tweetedHowLongAgo(tweeted_at){
  var now = new Date();
  var then = new Date(tweeted_at);
  var howLongAgo = now - then;
  return howLongAgo;
}

function tweetTimeElement(tweeted_at){
  var howLongAgo = new Date(tweetedHowLongAgo(tweeted_at));
  var hours = howLongAgo.getHours();
  var minutes = howLongAgo.getMinutes();
  if(hours == 0){
    return '<time>'+minutes+'m'+'</time>';
  }else{
    return '<time>'+hours+'h '+minutes+'m'+'</time>';
  };
}
