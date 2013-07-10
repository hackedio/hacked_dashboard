require 'spec_helper'

describe "new_items/edit" do
  before(:each) do
    @new_item = assign(:new_item, stub_model(NewItem,
      :itemtype => "MyString",
      :itemid => "MyString"
    ))
  end

  it "renders the edit new_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", new_item_path(@new_item), "post" do
      assert_select "input#new_item_itemtype[name=?]", "new_item[itemtype]"
      assert_select "input#new_item_itemid[name=?]", "new_item[itemid]"
    end
  end
end
