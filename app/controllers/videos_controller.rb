class VideosController < ActionController::API
	
	# GET /listings.json
  def index
    @videos = Video.find(:all)

    render json: @videos
  end

	# POST /leads.json
  def create
    @video = Video.new(params[:video])

    if @video.save
      render json: @video, status: :created 
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end
end
