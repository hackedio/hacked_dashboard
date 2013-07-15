require "spec_helper"

describe YoutubeVideosController do
  describe "routing" do

    it "routes to #index" do
      get("/youtube_videos").should route_to("youtube_videos#index")
    end

    it "routes to #new" do
      get("/youtube_videos/new").should route_to("youtube_videos#new")
    end

    it "routes to #show" do
      get("/youtube_videos/1").should route_to("youtube_videos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/youtube_videos/1/edit").should route_to("youtube_videos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/youtube_videos").should route_to("youtube_videos#create")
    end

    it "routes to #update" do
      put("/youtube_videos/1").should route_to("youtube_videos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/youtube_videos/1").should route_to("youtube_videos#destroy", :id => "1")
    end

  end
end
