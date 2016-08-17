#!/usr/bin/ruby
require "twitter"
require "json"

j_file= "./user_data.json"
key= open(j_file) do |io|
  JSON.load(io)
end


client=Twitter::REST::Client.new do |config|
    config.consumer_key= key["c_k"]
    config.consumer_secret= key["c_s"]
    config.access_token= key["a_t"]
    config.access_token_secret= key["a_s"]
end
client.update(ARGV[0])

