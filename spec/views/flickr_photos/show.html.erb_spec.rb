require 'spec_helper'

describe "flickr_photos/show" do
  before(:each) do
    @flickr_photo = assign(:flickr_photo, stub_model(FlickrPhoto,
      :ownername => "Ownername",
      :server => "Server",
      :photoid => "Photoid",
      :secret => "Secret"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ownername/)
    rendered.should match(/Server/)
    rendered.should match(/Photoid/)
    rendered.should match(/Secret/)
  end
end
