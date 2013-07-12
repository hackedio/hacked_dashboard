require 'spec_helper'

describe "youtube_videos/index" do
  before(:each) do
    assign(:youtube_videos, [
      stub_model(YoutubeVideo,
        :videoid => "Videoid",
        :videourl => "Videourl",
        :authorname => "Authorname"
      ),
      stub_model(YoutubeVideo,
        :videoid => "Videoid",
        :videourl => "Videourl",
        :authorname => "Authorname"
      )
    ])
  end

  it "renders a list of youtube_videos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Videoid".to_s, :count => 2
    assert_select "tr>td", :text => "Videourl".to_s, :count => 2
    assert_select "tr>td", :text => "Authorname".to_s, :count => 2
  end
end
