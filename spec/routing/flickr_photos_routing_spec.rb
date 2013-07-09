require "spec_helper"

describe FlickrPhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/flickr_photos").should route_to("flickr_photos#index")
    end

    it "routes to #new" do
      get("/flickr_photos/new").should route_to("flickr_photos#new")
    end

    it "routes to #show" do
      get("/flickr_photos/1").should route_to("flickr_photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/flickr_photos/1/edit").should route_to("flickr_photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/flickr_photos").should route_to("flickr_photos#create")
    end

    it "routes to #update" do
      put("/flickr_photos/1").should route_to("flickr_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/flickr_photos/1").should route_to("flickr_photos#destroy", :id => "1")
    end

  end
end
