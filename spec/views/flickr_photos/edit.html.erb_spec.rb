require 'spec_helper'

describe "flickr_photos/edit" do
  before(:each) do
    @flickr_photo = assign(:flickr_photo, stub_model(FlickrPhoto,
      :ownername => "MyString",
      :server => "MyString",
      :photoid => "MyString",
      :secret => "MyString"
    ))
  end

  it "renders the edit flickr_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flickr_photo_path(@flickr_photo), "post" do
      assert_select "input#flickr_photo_ownername[name=?]", "flickr_photo[ownername]"
      assert_select "input#flickr_photo_server[name=?]", "flickr_photo[server]"
      assert_select "input#flickr_photo_photoid[name=?]", "flickr_photo[photoid]"
      assert_select "input#flickr_photo_secret[name=?]", "flickr_photo[secret]"
    end
  end
end
