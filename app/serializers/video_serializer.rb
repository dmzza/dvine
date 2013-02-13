class VideoSerializer < ActiveModel::Serializer
	attributes :id, :url, :caption

	def url
		video.url
	end

	def caption
		video.caption
	end
end