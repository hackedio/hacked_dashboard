class FlickrPhotosController < ApplicationController
  before_action :set_flickr_photo, only: [:show, :edit, :update, :destroy]

  # GET /flickr_photos
  # GET /flickr_photos.json
  def index
    @flickr_photos = FlickrPhoto.all
  end

  # GET /flickr_photos/1
  # GET /flickr_photos/1.json
  def show
  end

  # GET /flickr_photos/new
  def new
    @flickr_photo = FlickrPhoto.new
  end

  # GET /flickr_photos/1/edit
  def edit
  end

  # POST /flickr_photos
  # POST /flickr_photos.json
  def create
    @flickr_photo = FlickrPhoto.new(flickr_photo_params)

    respond_to do |format|
      if @flickr_photo.save
        format.html { redirect_to @flickr_photo, notice: 'Flickr photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @flickr_photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @flickr_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flickr_photos/1
  # PATCH/PUT /flickr_photos/1.json
  def update
    respond_to do |format|
      if @flickr_photo.update(flickr_photo_params)
        format.html { redirect_to @flickr_photo, notice: 'Flickr photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @flickr_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flickr_photos/1
  # DELETE /flickr_photos/1.json
  def destroy
    @flickr_photo.destroy
    respond_to do |format|
      format.html { redirect_to flickr_photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flickr_photo
      @flickr_photo = FlickrPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flickr_photo_params
      params.require(:flickr_photo).permit(:photoid, :ownername, :photo_url, :date_added)
    end
end
