// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  getAllTweets();
});

var current_latest_item;

function getAllTweets(){
  var url = "/tweets.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(tweets){
      processTweets(tweets);
      getLatestItem();
    }
  });
}

function processTweets(tweets){
  $.each(tweets, function(index, tweet){
    appendTweet(tweet);
  });
}

function appendTweet(tweet){
  $('#tweets').append(
    ' <article class="text tweet"> \
        '+tweetTimeElement(tweet['tweeted_at'])+' \
        <img src=\"'+tweet['profile_image_url']+'\" /> \
        <h5><b>'+tweet['name']+'</b> @'+tweet['screen_name']+'</h5> \
        <blockquote>'+tweet['tweet_text']+'</blockquote> \
      </article> '
  );
  console.log('tweet appended');
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

function getLatestItem(){
  var url = "/new_items.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(items){
      current_latest_item = items['info']['latest_item'];
      loopFindNewItems();
    }
  });
}

function loopFindNewItems(){
  setInterval(function(){
    console.log('checking for new items ' + new Date());
    var url = "/new_items.json";
    $.ajax({
      type: "GET",
      dataType: "json",
      url: url,
      success: function(items){
        var new_item = items[current_latest_item+1];
        if (new_item){
          current_latest_item = current_latest_item+1;
          console.log('new item found!!!');
          updatePage(new_item);
        }else{
          console.log('no new items found');
        };
      }
    });
  },5000);
}

function updatePage(item){
  console.log('gone into updatePage function');
  if(item['itemtype'] == 'tweet'){
    console.log('tweet found');
    console.log('adding new tweet to page');
    addNewTweetToPage(item['itemid']);
  }else if(item['itemtype'] == 'flickr'){
    console.log('item type flickr found');
    console.log('adding new flickr photo to page');
    addNewPhotoToPage(item['itemid']);
  };
}

function addNewTweetToPage(tweetid){
  console.log('Gone into addNewTweetToPage function');
  var url = "/tweets.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(tweets){
      console.log('checking if tweets[tweetid] exists');
      if(tweets[tweetid]){
        console.log('yep it exists! Appending to page!');
        appendTweet(tweets[tweetid]);
      }
    }
  });
}
