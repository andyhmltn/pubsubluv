require 'bundler/setup'
Bundler.require

# usage:
# ruby server.rb username channel

redis = Redis.new

data = {"user" => ARGV[0]}

loop do
	message = STDIN.gets

	redis.publish ARGV[1], data.merge('message' =>message.strip).to_json
end