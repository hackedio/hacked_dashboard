require 'spec_helper'

describe "tweets/show" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :tweetid => 1,
      :name => "Name",
      :screen_name => "Screen Name",
      :tweet_text => "MyText",
      :media_url => "Media Url",
      :profile_image_url => "Profile Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Screen Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Media Url/)
    rendered.should match(/Profile Image Url/)
  end
end
