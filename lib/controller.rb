require 'gossip'

class ApplicationController < Sinatra::Base
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    puts "Voici le numéro du potin que tu veux : #{params["id"]}!"
    erb :show, locals: {gossip: Gossip.find(params["id"])}
  end

end