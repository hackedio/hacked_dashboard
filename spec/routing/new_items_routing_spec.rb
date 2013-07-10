require "spec_helper"

describe NewItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/new_items").should route_to("new_items#index")
    end

    it "routes to #new" do
      get("/new_items/new").should route_to("new_items#new")
    end

    it "routes to #show" do
      get("/new_items/1").should route_to("new_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/new_items/1/edit").should route_to("new_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/new_items").should route_to("new_items#create")
    end

    it "routes to #update" do
      put("/new_items/1").should route_to("new_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/new_items/1").should route_to("new_items#destroy", :id => "1")
    end

  end
end
