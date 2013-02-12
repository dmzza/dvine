class VideosController < ActionController::API
	
	# GET /videos.json
  def index
    @videos = Video.find(:all)

    render json: @videos
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