require 'bundler/setup'
Bundler.require

redis = Redis.new

redis.subscribe(ARGV[0]) do |on|

	on.message do |channel, message|
		data = JSON.parse(message)

		puts "##{channel} - [#{data['user']}]: #{data['message']}"
	end

end 