require 'spec_helper'

describe "flickr_photos/index" do
  before(:each) do
    assign(:flickr_photos, [
      stub_model(FlickrPhoto,
        :ownername => "Ownername",
        :photo_url => "PhotoURL",
        :date_added => "DateAdded"
      ),
      stub_model(FlickrPhoto,
        :ownername => "Ownername",
        :photo_url => "PhotoURL",
        :date_added => "DateAdded"
      )
    ])
  end

  it "renders a list of flickr_photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ownername".to_s, :count => 2
    assert_select "tr>td", :text => "PhotoURL".to_s, :count => 2
    assert_select "tr>td", :text => "DateAdded".to_s, :count => 2
  end
end
