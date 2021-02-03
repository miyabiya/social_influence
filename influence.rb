#!/usr/bin/ruby

require 'net/http'
require 'uri'
require 'json'
module Influence
  def get_youtube_profile(channel_id, token)
    uri = URI.parse('https://www.googleapis.com')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'

    headers = { 'Content-Type' => 'application/json' }
    response = http.get("/youtube/v3/channels?id=#{channel_id}&key=#{token}&part=statistics", headers)
    JSON.parse(response.body)
  end

  def get_twitter_profile(username, token)
    uri = URI.parse('https://api.twitter.com')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'

    headers = { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}" }
    response = http.get("/1.1/users/show.json?screen_name=#{username}", headers)
    JSON.parse(response.body)
  end

  def get_instagram_profile(username)
    uri = URI.parse('https://www.instagram.com')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'

    headers = { 'Content-Type' => 'application/json' }
    response = http.get("/#{username}/?__a=1", headers)
    JSON.parse(response.body)
  end
end