#!/usr/bin/env ruby
require 'Twitter'
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "AmbJ7Eqiy7wbQKBjEh5kRcCln"
  config.consumer_secret     = "8cDK3f39xrwFOd5yGyzozsxoibbxoB0I9hZtDo1b9QVczLs78a"
  config.access_token        = "933637654318641153-O8OQd0g5p2qksdw1D1sIw9NNjJNNDFH"
  config.access_token_secret = "ynmSV8SHEpn54IXStLq4sMcNcFG3kBZ68F8pcJJTfo7N3"
end

search_options = {
  result_type: "recent",
  geocode: "48.856614,2.3522219000000177,10mi"
}

client.search("gateaux", search_options).take(50).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
 client.favorite(tweet)
 client.update("@#{tweet.user.screen_name} Tasty!")
end
