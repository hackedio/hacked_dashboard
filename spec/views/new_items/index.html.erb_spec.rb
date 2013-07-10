require 'spec_helper'

describe "new_items/index" do
  before(:each) do
    assign(:new_items, [
      stub_model(NewItem,
        :itemtype => "Itemtype",
        :itemid => "Itemid"
      ),
      stub_model(NewItem,
        :itemtype => "Itemtype",
        :itemid => "Itemid"
      )
    ])
  end

  it "renders a list of new_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Itemtype".to_s, :count => 2
    assert_select "tr>td", :text => "Itemid".to_s, :count => 2
  end
end
