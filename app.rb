require 'sinatra'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  before do
    @game = Game.current
  end

  get '/' do
    erb(:index)
  end
  # start the server if ruby file executed directly
  run! if app_file == $0

  post '/names' do
    Game.create(Player.new(params[:name_1]),Player.new(params[:name_2]))
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post '/attack' do
    @game.hit
    redirect @game.over? ? "/over" : "/attack"
  end

  get '/attack' do
   erb(:attack)
  end

  post '/switch' do
    @game.switch
    redirect '/play'
  end

  get '/over' do
     erb(:over)
  end
end
