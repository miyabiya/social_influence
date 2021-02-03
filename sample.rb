#!/usr/bin/ruby

require './influence'
include Influence

GOOGLE_API_TOKEN = ""
TWITTER_DEVELOPER_TOKEN = ""

youtube_channel_id = ''
puts Influence.get_youtube_profile(youtube_channel_id, GOOGLE_API_TOKEN)

twitter_username = ''
puts Influence.get_twitter_profile(twitter_username, TWITTER_DEVELOPER_TOKEN)