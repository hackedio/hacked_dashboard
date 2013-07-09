require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FlickrPhotosController do

  # This should return the minimal set of attributes required to create a valid
  # FlickrPhoto. As you add validations to FlickrPhoto, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "ownername" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FlickrPhotosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all flickr_photos as @flickr_photos" do
      flickr_photo = FlickrPhoto.create! valid_attributes
      get :index, {}, valid_session
      assigns(:flickr_photos).should eq([flickr_photo])
    end
  end

  describe "GET show" do
    it "assigns the requested flickr_photo as @flickr_photo" do
      flickr_photo = FlickrPhoto.create! valid_attributes
      get :show, {:id => flickr_photo.to_param}, valid_session
      assigns(:flickr_photo).should eq(flickr_photo)
    end
  end

  describe "GET new" do
    it "assigns a new flickr_photo as @flickr_photo" do
      get :new, {}, valid_session
      assigns(:flickr_photo).should be_a_new(FlickrPhoto)
    end
  end

  describe "GET edit" do
    it "assigns the requested flickr_photo as @flickr_photo" do
      flickr_photo = FlickrPhoto.create! valid_attributes
      get :edit, {:id => flickr_photo.to_param}, valid_session
      assigns(:flickr_photo).should eq(flickr_photo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FlickrPhoto" do
        expect {
          post :create, {:flickr_photo => valid_attributes}, valid_session
        }.to change(FlickrPhoto, :count).by(1)
      end

      it "assigns a newly created flickr_photo as @flickr_photo" do
        post :create, {:flickr_photo => valid_attributes}, valid_session
        assigns(:flickr_photo).should be_a(FlickrPhoto)
        assigns(:flickr_photo).should be_persisted
      end

      it "redirects to the created flickr_photo" do
        post :create, {:flickr_photo => valid_attributes}, valid_session
        response.should redirect_to(FlickrPhoto.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved flickr_photo as @flickr_photo" do
        # Trigger the behavior that occurs when invalid params are submitted
        FlickrPhoto.any_instance.stub(:save).and_return(false)
        post :create, {:flickr_photo => { "ownername" => "invalid value" }}, valid_session
        assigns(:flickr_photo).should be_a_new(FlickrPhoto)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FlickrPhoto.any_instance.stub(:save).and_return(false)
        post :create, {:flickr_photo => { "ownername" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested flickr_photo" do
        flickr_photo = FlickrPhoto.create! valid_attributes
        # Assuming there are no other flickr_photos in the database, this
        # specifies that the FlickrPhoto created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FlickrPhoto.any_instance.should_receive(:update).with({ "ownername" => "MyString" })
        put :update, {:id => flickr_photo.to_param, :flickr_photo => { "ownername" => "MyString" }}, valid_session
      end

      it "assigns the requested flickr_photo as @flickr_photo" do
        flickr_photo = FlickrPhoto.create! valid_attributes
        put :update, {:id => flickr_photo.to_param, :flickr_photo => valid_attributes}, valid_session
        assigns(:flickr_photo).should eq(flickr_photo)
      end

      it "redirects to the flickr_photo" do
        flickr_photo = FlickrPhoto.create! valid_attributes
        put :update, {:id => flickr_photo.to_param, :flickr_photo => valid_attributes}, valid_session
        response.should redirect_to(flickr_photo)
      end
    end

    describe "with invalid params" do
      it "assigns the flickr_photo as @flickr_photo" do
        flickr_photo = FlickrPhoto.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FlickrPhoto.any_instance.stub(:save).and_return(false)
        put :update, {:id => flickr_photo.to_param, :flickr_photo => { "ownername" => "invalid value" }}, valid_session
        assigns(:flickr_photo).should eq(flickr_photo)
      end

      it "re-renders the 'edit' template" do
        flickr_photo = FlickrPhoto.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FlickrPhoto.any_instance.stub(:save).and_return(false)
        put :update, {:id => flickr_photo.to_param, :flickr_photo => { "ownername" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested flickr_photo" do
      flickr_photo = FlickrPhoto.create! valid_attributes
      expect {
        delete :destroy, {:id => flickr_photo.to_param}, valid_session
      }.to change(FlickrPhoto, :count).by(-1)
    end

    it "redirects to the flickr_photos list" do
      flickr_photo = FlickrPhoto.create! valid_attributes
      delete :destroy, {:id => flickr_photo.to_param}, valid_session
      response.should redirect_to(flickr_photos_url)
    end
  end

end