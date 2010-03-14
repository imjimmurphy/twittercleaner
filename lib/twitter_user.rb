

class TwitterUser

	BIG_LIMIT = 2000	

	def initialize(f)
		friend = f
	end

	def screen_name
		friend['screen_name']
	end
		
	def last_update_text
		friend['status']['text'] if friend['status']
	end

	def last_update_time
		Time.parse(friend['status']['created_at']) if friend['status']
	end
	
	def last_update_age
		 (Time.new().to_i - last_updated_time.to_i) / 86400.0
	end
	
	def account_created
		Time.parse(friend['created_at'])
	end

	def account_age
		(Time.new().to_i - account_created.to_i) / 86400.0
	end

	def bio
		friend['description'] 
	end
	
	def url
		return friend['url']
	end

	def tweet_count
		friend['statuses_count'].to_i
	end

	def friends_count
		friend['friends_count'].to_i 
	end
	
	def followers_count
		friend['followers_count'].to_i
	end

	def tweet_rate
		tweet_count / account_age if account_age > 0
	end

	def follow_ratio
		(followers_count / friends_count) if friends_count > 0
	end

	def location
		friend['location']
	end
	
	def custom_image?
		friend['profile_image_url'].match("default_profile")
	end
	
	def favourites_count
		friend['favourites_count']
	end

	def big_audience?
		friends_count > BIG_LIMIT	
	end	
end



