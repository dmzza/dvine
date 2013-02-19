class Video < ActiveRecord::Base
	attr_accessible :caption, :url

	def authenticate_vine
		username = ENV['VINE_USERNAME']
		password = ENV['VINE_PASSWORD']
		response = Faraday.post 'https://api.vineapp.com/users/authenticate', :username => username, :password => password
		res = ActiveSupport::JSON.decode(response.body)
		res["data"]
	end



	def get_videos_by_tag(tag)
		@key = Rails.cache.fetch("vine_key", :expires_in => 1.day) do
			authenticate_vine
		end
		conn = Faraday.new
		response = conn.get "https://api.vineapp.com/timelines/tags/#{tag}" do |request|
			request.headers['user-agent'] = 'com.vine.iphone/1.0.3 (unknown, iPhone OS 6.1.0, iPhone, Scale/2.000000)'
			request.headers['vine-session-id'] = @key['key']
			request.headers['accept-language'] = 'en, sv, fr, de, ja, nl, it, es, pt, pt-PT, da, fi, nb, ko, zh-Hans, zh-Hant, ru, pl, tr, uk, ar, hr, cs, el, he, ro, sk, th, id, ms, en-GB, ca, hu, vi, en-us;q=0.8'
		end
		parsed = ActiveSupport::JSON.decode(response.body)
		vines = parsed['data']['records']

		vines.each do |vine|
			params = Hash.new
			params['url'] = vine['videoUrl']
			params['caption'] = vine['description']
			video = Video.new(params)

			video.save
		end
	end
end