require 'spec_helper'

describe "stats/show" do
  before(:each) do
    @stat = assign(:stat, stub_model(Stat,
      :name => "Name",
      :value => 1,
      :display => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
