require 'sinatra'
# require 'sinatra/reloader'
# gem install sinatra-contrib

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if guess.nil? || guess == 0
    ""
  elsif guess == SECRET_NUMBER
    "You got it right! The secret number is #{SECRET_NUMBER}"
  elsif guess > SECRET_NUMBER && guess <= SECRET_NUMBER + 5
    "Too Hi!"
  elsif guess < SECRET_NUMBER && guess >= SECRET_NUMBER - 5
    "Too Low!"
  elsif guess > SECRET_NUMBER
    "Way Too Hi!"
  elsif guess < SECRET_NUMBER
    "Way Too Low!"
  end
end
