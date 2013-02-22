# require_relative '../../vine'

class Video < ActiveRecord::Base
	attr_accessible :caption, :url
	class << self
		def authenticate_vine
			username = ENV['VINE_USERNAME']
			password = ENV['VINE_PASSWORD']
			connection = Faraday::Connection.new 'https://api.vineapp.com', :ssl => { :verify => false }
			response = connection.post '/users/authenticate', :username => username, :password => password 
			res = ActiveSupport::JSON.decode(response.body)
			logger.info res
			res["data"]
		end

		def search_vine(tag, session)
			connection = Faraday::Connection.new 'https://api.vineapp.com', :ssl => { :verify => false }
			response = connection.get "/timelines/tags/#{tag}" do |request|
				request.headers['user-agent'] = 'com.vine.iphone/1.0.3 (unknown, iPhone OS 6.1.0, iPhone, Scale/2.000000)'
				request.headers['vine-session-id'] = session
				request.headers['accept-language'] = 'en, sv, fr, de, ja, nl, it, es, pt, pt-PT, da, fi, nb, ko, zh-Hans, zh-Hant, ru, pl, tr, uk, ar, hr, cs, el, he, ro, sk, th, id, ms, en-GB, ca, hu, vi, en-us;q=0.8'
			end
			parsed = ActiveSupport::JSON.decode(response.body)
			vines = parsed['data']['records']
			vines
		end


		def get_videos_by_tag(tag)
			@key = Rails.cache.fetch("vine_key", :expires_in => 1.day) do
				authenticate_vine
			end
			logger.info "key: #{@key['key']}"
			@vines = search_vine(tag, @key['key'])

			@vines.each do |vine|
				caption = vine['description']
				tags = vine['tags']
				tags.each do |tag|
					if(!caption.include? "\##{tag['tag']}")
						caption = "#{caption} \##{tag['tag']}"
					end
				end
				params = Hash.new
				params['url'] = vine['videoUrl']
				params['caption'] = caption

				video = Video.new(params)

				begin
					video.save
				rescue
					logger.info "duplicate"
				end
			end
		end
		
	    # handle_asynchronously :get_videos_by_tag
	end
end