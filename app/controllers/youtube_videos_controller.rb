class YoutubeVideosController < ApplicationController
  layout 'plain'
  before_action :set_youtube_video, only: [:show, :edit, :update, :destroy]

  # GET /youtube_videos
  # GET /youtube_videos.json
  def index
    @youtube_videos = YoutubeVideo.all
  end

  # GET /youtube_videos/1
  # GET /youtube_videos/1.json
  def show
  end

  # GET /youtube_videos/new
  def new
    @youtube_video = YoutubeVideo.new
  end

  # GET /youtube_videos/1/edit
  def edit
  end

  # POST /youtube_videos
  # POST /youtube_videos.json
  def create
    @youtube_video = YoutubeVideo.new(youtube_video_params)

    respond_to do |format|
      if @youtube_video.save
        format.html { redirect_to @youtube_video, notice: 'Youtube video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @youtube_video }
      else
        format.html { render action: 'new' }
        format.json { render json: @youtube_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /youtube_videos/1
  # PATCH/PUT /youtube_videos/1.json
  def update
    respond_to do |format|
      if @youtube_video.update(youtube_video_params)
        format.html { redirect_to @youtube_video, notice: 'Youtube video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @youtube_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youtube_videos/1
  # DELETE /youtube_videos/1.json
  def destroy
    @youtube_video.destroy
    respond_to do |format|
      format.html { redirect_to youtube_videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_youtube_video
      @youtube_video = YoutubeVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def youtube_video_params
      params.require(:youtube_video).permit(:videoid, :videourl, :authorname, :dateuploaded)
    end
end
