require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/tamagotchi'
require 'pry'

get '/' do
  Tamagotchi.clear()
  erb(:landing)
end

get '/my_pet/:id/:action' do
  @my_pet = Tamagotchi.find(params[:id].to_i)
  @my_pet.update_vitals(Time.new())
  @my_pet.send(params[:action])
  erb(:my_tamagotchi)
end

get '/my_pet/:id' do
  @my_pet = Tamagotchi.find(params[:id].to_i)
  @my_pet.update_vitals(Time.new())
  erb(:my_tamagotchi)
end

post '/new_pet' do
  name = params.fetch('name')
  @my_pet = Tamagotchi.new(name)
  @my_pet.save()
  erb(:my_tamagotchi)
end
