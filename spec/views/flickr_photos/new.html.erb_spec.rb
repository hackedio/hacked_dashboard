require 'spec_helper'

describe "flickr_photos/new" do
  before(:each) do
    assign(:flickr_photo, stub_model(FlickrPhoto,
      :ownername => "MyString",
      :photo_url => "MyString",
      :date_added => Date.today,
    ).as_new_record)
  end

  it "renders new flickr_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flickr_photos_path, "post" do
      assert_select "input#flickr_photo_ownername[name=?]", "flickr_photo[ownername]"
      assert_select "input#flickr_photo_photo_url[name=?]", "flickr_photo[photo_url]"
      assert_select "select#flickr_photo_date_added_1i[name=?]", "flickr_photo[date_added(1i)]"
    end
  end
end
