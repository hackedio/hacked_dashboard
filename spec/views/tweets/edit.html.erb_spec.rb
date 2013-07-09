require 'spec_helper'

describe "tweets/edit" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :tweetid => 1,
      :name => "MyString",
      :screen_name => "MyString",
      :tweet_text => "MyText",
      :media_url => "MyString",
      :profile_image_url => "MyString"
    ))
  end

  it "renders the edit tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tweet_path(@tweet), "post" do
      assert_select "input#tweet_tweetid[name=?]", "tweet[tweetid]"
      assert_select "input#tweet_name[name=?]", "tweet[name]"
      assert_select "input#tweet_screen_name[name=?]", "tweet[screen_name]"
      assert_select "textarea#tweet_tweet_text[name=?]", "tweet[tweet_text]"
      assert_select "input#tweet_media_url[name=?]", "tweet[media_url]"
      assert_select "input#tweet_profile_image_url[name=?]", "tweet[profile_image_url]"
    end
  end
end
