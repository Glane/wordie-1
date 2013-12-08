class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Class Method to call client in instance methods
  #
  # Example:
	# 		def instance_method
	# 			User.client_call.user(@twitter_screenname).some_twitter_method
	# 		end
	def twitter_call
		Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV['CONSUMER_KEY']
			config.consumer_secret     = ENV['CONSUMER_SECRET']
			config.access_token         = ENV['ACCESS_TOKEN']
			config.access_token_secret  = ENV['ACCESS_TOKEN_SECRET']
		end
	end

	def current_status
		twitter_call.user(twitter_screenname).status.text
	end

	def tweet_wordie?
		current_status.split(" ").include?("Hackathon")
	end

end
