require 'spec_helper'

describe "stats/new" do
  before(:each) do
    assign(:stat, stub_model(Stat,
      :name => "MyString",
      :value => 1,
      :display => false
    ).as_new_record)
  end

  it "renders new stat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stats_path, "post" do
      assert_select "input#stat_name[name=?]", "stat[name]"
      assert_select "input#stat_value[name=?]", "stat[value]"
      assert_select "input#stat_display[name=?]", "stat[display]"
    end
  end
end
