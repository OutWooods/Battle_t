require 'sinatra'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end
  # start the server if ruby file executed directly
  run! if app_file == $0

  post '/names' do
    $game = Game.new(Player.new(params[:name_1]),Player.new(params[:name_2]))
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  post '/attack' do
    @game = $game
    @game.hit
    redirect @game.over? ? "/over" : "/attack"
  end

  get '/attack' do
    @game = $game
   erb(:attack)
  end

  post '/switch' do
    @game = $game
    @game.switch
    redirect '/play'
  end

  get '/over' do
     @game = $game
     erb(:over)
  end
end
