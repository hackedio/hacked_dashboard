require 'spec_helper'

describe "flickr_photos/edit" do
  before(:each) do
    @flickr_photo = assign(:flickr_photo, stub_model(FlickrPhoto,
      :ownername => "MyString",
      :photo_url => "MyString",
      :date_added => Date.today
    ))
  end

  it "renders the edit flickr_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flickr_photo_path(@flickr_photo), "post" do
      assert_select "input#flickr_photo_ownername[name=?]", "flickr_photo[ownername]"
      assert_select "input#flickr_photo_photo_url[name=?]", "flickr_photo[photo_url]"
      assert_select "select#flickr_photo_date_added_1i[name=?]", "flickr_photo[date_added(1i)]"
    end
  end
end
