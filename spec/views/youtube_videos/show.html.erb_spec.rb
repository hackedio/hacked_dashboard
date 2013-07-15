require 'spec_helper'

describe "youtube_videos/show" do
  before(:each) do
    @youtube_video = assign(:youtube_video, stub_model(YoutubeVideo,
      :videoid => "Videoid",
      :videourl => "Videourl",
      :authorname => "Authorname"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Videoid/)
    rendered.should match(/Videourl/)
    rendered.should match(/Authorname/)
  end
end
