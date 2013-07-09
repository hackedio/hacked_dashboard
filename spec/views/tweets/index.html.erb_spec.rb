require 'spec_helper'

describe "tweets/index" do
  before(:each) do
    assign(:tweets, [
      stub_model(Tweet,
        :tweetid => 1,
        :name => "Name",
        :screen_name => "Screen Name",
        :tweet_text => "MyText",
        :media_url => "Media Url",
        :profile_image_url => "Profile Image Url"
      ),
      stub_model(Tweet,
        :tweetid => 1,
        :name => "Name",
        :screen_name => "Screen Name",
        :tweet_text => "MyText",
        :media_url => "Media Url",
        :profile_image_url => "Profile Image Url"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Media Url".to_s, :count => 2
    assert_select "tr>td", :text => "Profile Image Url".to_s, :count => 2
  end
end
