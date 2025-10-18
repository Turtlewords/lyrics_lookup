require "sinatra"
require "sinatra/reloader"
require "http"
require "dotenv/load"
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
  erb(:found_lyrics)
end

get("/found_title") do
  erb(:found_title)
end
