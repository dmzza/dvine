class VideoSerializer < ActiveModel::Serializer
	attributes :id, :url, :caption, :created_at

	def url
		video.url
	end

	def caption
		video.caption
	end

	def created_at
		video.created_at
	end
end