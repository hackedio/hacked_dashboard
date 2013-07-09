require 'spec_helper'

describe "flickr_photos/show" do
  before(:each) do
    @flickr_photo = assign(:flickr_photo, stub_model(FlickrPhoto,
      :ownername => "Ownername",
      :photo_url => "PhotoURL",
      :date_added => "DateAdded"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ownername/)
    rendered.should match(/PhotoURL/)
    rendered.should match(/DateAdded/)
  end
end
