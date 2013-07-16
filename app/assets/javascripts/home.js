// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  getAllTweets();
  getAllFlickrPhotos();
  keepUpdatingTweetTimes();
  setCountdownTimer();
  getStats();
  displayNotification();
});

var current_latest_item;

function displayNotification(){
  var url = "/notifications.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(notifications){
      var latest = notifications['info']['latest_notification'];
      $("#notification marquee").text(notifications[latest]['text']);
      setTimeout(function(){
        displayNotification();
      },5000);
    }
  });
}

function getStats(){
  var url = "/stats.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(stats){
      displayStats(stats);
      setTimeout(function(){
        getStats();
      }, 5000);
    }
  });
}

function displayStats(stats){
  $('.stats').html("");
  $.each(stats, function(index,stat){
    if(stat['display']==true){
      $('.stats').append('<p><span>'+stat['value']+'</span> '+stat['name']+'</p>');
    };
  });
}

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

function getAllFlickrPhotos(){
  console.log('getting all flickr photos');
  var url = "/flickr_photos.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(photos){
      getAllYoutubeVids(photos);
    }
  });
}

function getAllYoutubeVids(photos){
  console.log('getting all youtube videos');
  var url = "/youtube_videos.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(videos){
      orderVideosAndPhotos(videos, photos);
    }
  });
}

function orderVideosAndPhotos(videos, photos){
  console.log('getting all new items');
  var url = "/new_items.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(items){
      processVideosAndPhotos(items,videos,photos);
    }
  });
}

function processVideosAndPhotos(items,videos,photos){
  console.log('processing videos and photos');
  $.each(items, function(index, item){
    if (item['itemtype'] == 'flickr'){
      console.log('item type is flickr');
      if(photos[item['itemid']]){
        appendPhoto(photos[item['itemid']])
      };
    }else if (item['itemtype'] == 'youtube'){
      console.log('item type is youtube');
      if(videos[item['itemid']]){
        appendVideo(videos[item['itemid']])
      };
    };
  });
}

function getLatestItem(){
  var url = "/new_items.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(items){
      current_latest_item = items['info']['latest_item'];
      console.log('latest new item is: '+current_latest_item);
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
          console.log('new item found with id:' + current_latest_item);
          updatePage(new_item);
        }else{
          console.log('no new items found');
        };
      }
    });
  },5000);
}

function keepUpdatingTweetTimes(){
  setInterval(function(){
    console.log('updating tweet times');
    var times = $('.tweeted_at');
    $.each(times, function(index, time){
      var tweetedat = $(time).data('tweetedat');
      updateTweetTime(time, tweetedat);
    });
  },30000);
}

function updateTweetTime(time, tweetedat){
  var howLongAgo = new Date(tweetedHowLongAgo(tweetedat));
  var hours = howLongAgo.getHours();
  var minutes = howLongAgo.getMinutes();

  if(hours == 0){
    $(time).html(minutes+'m ago');
  }else{
    $(time).html(hours+'h '+minutes+'m ago');
  };
}

function processTweets(tweets){
  $.each(tweets, function(index, tweet){
    appendTweet(tweet);
  });
}

function appendTweet(tweet){
  if(tweet['media_url']==null){
    var tweeted_image = '';
  }else{
    var tweeted_image = '<div style="width:100%;text-align:center;"><img style="width:30%;height:30%;" src=\"'+tweet['media_url']+'\" /></div>';
  };
  $('#tweets').prepend(
    ' <article class="text tweet"> \
        '+tweetTimeElement(tweet['tweeted_at'])+' \
        <img class="profile" src=\"'+tweet['profile_image_url']+'\" /> \
        <div><h5><b>'+tweet['name']+'</b> @'+tweet['screen_name']+'</h5> \
        <blockquote>'+tweet['tweet_text']+'</blockquote></div> \
        '+tweeted_image+' \
      </article> '
  );
  console.log('tweet appended');
}

function appendPhoto(photo){
  console.log('appending flickr photo');
  $('#flickr_youtube').prepend(
    ' <article class="media flickr"> \
        <figure> \
          <img src="'+photo['photo_url']+'" alt="'+photo['ownername']+'\'s photo"> \
          <figcaption>Uploaded by <span>'+photo['ownername']+'</span></figcaption> \
        </figure> \
      </article> '
  );
}

function appendVideo(video){
  console.log('appending youtube video');
  $('#flickr_youtube').prepend(
    ' <article class="media youtube"> \
        <iframe src="'+video['videourl'].replace("\u0026","&")+'"></iframe> \
        <p>Uploaded by <span>'+video['authorname']+'</span></p> \
      </article> '
  );
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
    return '<time data-tweetedat=\"'+tweeted_at+'\" class=\"tweeted_at\">'+minutes+'m'+' ago</time>';
  }else{
    return '<time data-tweetedat=\"'+tweeted_at+'\" class=\"tweeted_at\">'+hours+'h '+minutes+'m'+' ago</time>';
  };
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
  }else if(item['itemtype'] == 'youtube'){
    console.log('item type youtube found');
    console.log('adding new youtube video to page');
    addNewVideoToPage(item['itemid']);
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
      console.log('checking if tweet '+tweets[tweetid]+' exists');
      if(tweets[tweetid]){
        console.log('yep it exists! Appending to page!');
        appendTweet(tweets[tweetid]);
      }
    }
  });
}

function addNewPhotoToPage(photoid){
  console.log('Gone into addNewPhotoToPage function');
  var url = "/flickr_photos.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(photos){
      console.log('checking if '+photos[photoid]+' exists');
      if(photos[photoid]){
        console.log('yep it exists! Appending to page!');
        appendPhoto(photos[photoid]);
      }
    }
  });
}

function addNewVideoToPage(videoid){
  console.log('Gone into addNewVideoToPage function');
  var url = "/youtube_videos.json";
  $.ajax({
    type: "GET",
    dataType: "json",
    url: url,
    success: function(videos){
      console.log('checking if '+videos[videoid]+' exists');
      if(videos[videoid]){
        console.log('yep it exists! Appending to page!');
        appendVideo(videos[videoid]);
      }
    }
  });
}

function setCountdownTimer(){
  var hackedIsOver = new Date("2013-07-21 12:00:00");
  $('.countdown time').countdown({until: hackedIsOver, onTick: formatCountdownTime});
}

function formatCountdownTime(periods) {
  var days = doubleDigit(periods[3]);
  var hours = doubleDigit(periods[4]);
  var minutes = doubleDigit(periods[5]);
  var seconds = doubleDigit(periods[6]);
  $('.countdown time').text(days + ':' + hours + ':' + minutes + ':' + seconds);
}

function doubleDigit(n) {
  return (n < 10) ? ("0" + n) : n;
}



