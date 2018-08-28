require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/tamagotchi'
require 'pry'

get '/' do
  erb(:landing)
end

post '/' do
  name = params.fetch('name')
  @my_pet = Tamagotchi.new(name)
  erb(:my_tamagotchi)
end
