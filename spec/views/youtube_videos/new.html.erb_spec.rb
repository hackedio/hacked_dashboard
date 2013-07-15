require 'spec_helper'

describe "youtube_videos/new" do
  before(:each) do
    assign(:youtube_video, stub_model(YoutubeVideo,
      :videoid => "MyString",
      :videourl => "MyString",
      :authorname => "MyString"
    ).as_new_record)
  end

  it "renders new youtube_video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", youtube_videos_path, "post" do
      assert_select "input#youtube_video_videoid[name=?]", "youtube_video[videoid]"
      assert_select "input#youtube_video_videourl[name=?]", "youtube_video[videourl]"
      assert_select "input#youtube_video_authorname[name=?]", "youtube_video[authorname]"
    end
  end
end
