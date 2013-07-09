require 'spec_helper'

describe "flickr_photos/new" do
  before(:each) do
    assign(:flickr_photo, stub_model(FlickrPhoto,
      :ownername => "MyString",
      :server => "MyString",
      :photoid => "MyString",
      :secret => "MyString"
    ).as_new_record)
  end

  it "renders new flickr_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flickr_photos_path, "post" do
      assert_select "input#flickr_photo_ownername[name=?]", "flickr_photo[ownername]"
      assert_select "input#flickr_photo_server[name=?]", "flickr_photo[server]"
      assert_select "input#flickr_photo_photoid[name=?]", "flickr_photo[photoid]"
      assert_select "input#flickr_photo_secret[name=?]", "flickr_photo[secret]"
    end
  end
end
