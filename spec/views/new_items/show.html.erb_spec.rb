require 'spec_helper'

describe "new_items/show" do
  before(:each) do
    @new_item = assign(:new_item, stub_model(NewItem,
      :itemtype => "Itemtype",
      :itemid => "Itemid"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Itemtype/)
    rendered.should match(/Itemid/)
  end
end
