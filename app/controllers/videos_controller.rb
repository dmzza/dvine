class VideosController < ActionController::API
	
	# GET /videos.json
  def index
    if params.has_key?("tag")
      @videos = Video.find(:all, :conditions => ["caption like ?", "%\##{params[:tag]}%"])
      render json: @videos
      Thread.new do
        Video.get_videos_by_tag(params[:tag])
      end
    else
      @videos = Video.find(:all, :order => "created_at DESC", :limit => 50)
      render json: @videos
    end
    
  end

  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])
    
    render json: @video
  end

	# POST /videos.json
  def create
    @video = Video.new(params[:video])

    if @video.save
      render json: @video, status: :created 
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end
end
