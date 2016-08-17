#!/usr/bin/ruby
require "twitter"
require "json"
ENV['TZ']= "Asia/Tokyo"

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
max_id= client.home_timeline.first.id
b_id= 0
while true do
  client.user_timeline(ARGV[0],{max_id:max_id-1,count:200}).each do |tweet|
    hoge=tweet.text.gsub("\n"," ")
    puts tweet.user.screen_name + "\t" + hoge + "\t"+ tweet.created_at.strftime("%Y\t%m\t%d\t%X")
    max_id= tweet.id unless tweet.retweeted?
  end
  if(b_id== max_id) then
    break
  else 
    b_id= max_id
  end
end

