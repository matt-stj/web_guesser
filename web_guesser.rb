require 'sinatra'
# require 'sinatra/reloader'
# gem install sinatra-contrib

number = rand(100)


get '/' do
  erb :index, :locals => {:number => number}
end
