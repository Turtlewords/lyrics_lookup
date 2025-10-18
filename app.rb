require "sinatra"
require "sinatra/reloader"
require "http"
require "dotenv/load"
require "amazing_print"
require "ai-chat"
require 'sinatra/tailwind'

get("/") do
  erb(:home)
end

get("/search_by_title") do
  erb(:search_by_title)
end

get("/search_by_lyrics") do
 

  erb(:search_by_lyrics)
end

get("/found_lyrics") do

   @artist = params.fetch("artist")
   @title = params.fetch("title")

   response = HTTP.get("https://api.lyrics.ovh/v1/#{@artist}/#{@title}")

   @data = JSON.parse(response)

  erb(:found_lyrics)
end

get("/found_title") do

   c = AI::Chat.new
  
  c.system("You are a helpful assistant who identifies musical artists and song titles from lyrics")

  @lyrics = params.fetch("lyrics")

  c.user(@lyrics)

  @ai_reply = c.generate!

  erb(:found_title)
end
