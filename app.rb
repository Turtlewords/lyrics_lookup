require "sinatra"
require "sinatra/reloader"
require "http"
require "dotenv/load"
require "ai-chat"

get("/") do
  erb(:home)
end
