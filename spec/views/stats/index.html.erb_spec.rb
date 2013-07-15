require 'spec_helper'

describe "stats/index" do
  before(:each) do
    assign(:stats, [
      stub_model(Stat,
        :name => "Name",
        :value => 1,
        :display => false
      ),
      stub_model(Stat,
        :name => "Name",
        :value => 1,
        :display => false
      )
    ])
  end

  it "renders a list of stats" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
