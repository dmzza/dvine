class VideoSerializer < ActiveModel::Serializer
	attributes :id, :url

	def url
		video.url
	end
end