require 'spec_helper'

describe "flickr_photos/index" do
  before(:each) do
    assign(:flickr_photos, [
      stub_model(FlickrPhoto,
        :ownername => "Ownername",
        :server => "Server",
        :photoid => "Photoid",
        :secret => "Secret"
      ),
      stub_model(FlickrPhoto,
        :ownername => "Ownername",
        :server => "Server",
        :photoid => "Photoid",
        :secret => "Secret"
      )
    ])
  end

  it "renders a list of flickr_photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ownername".to_s, :count => 2
    assert_select "tr>td", :text => "Server".to_s, :count => 2
    assert_select "tr>td", :text => "Photoid".to_s, :count => 2
    assert_select "tr>td", :text => "Secret".to_s, :count => 2
  end
end
