require 'spec_helper'

describe "NewItems" do
  describe "GET /new_items" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get new_items_path
      response.status.should be(200)
    end
  end
end
