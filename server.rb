require 'sinatra'
require 'json'

file = File.read('roster.json')
teams = JSON.parse(file)

get "/" do
  redirect "/kickball"
end

get "/kickball" do
  erb :index, locals: { teams: teams }
end

get "/kickball/teams/:team_name" do
  erb :show, locals: { team_name: params[:team_name], teams: teams }
end

get "/kickball/:position" do
  erb :position, locals: { position: params[:position], teams: teams }
end
