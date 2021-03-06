require 'sinatra'
# require 'sinatra/reloader'
# gem install sinatra-contrib

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  bg_color = color_checker(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :bg_color => bg_color}
end

def check_guess(guess)
  if params["cheat"] == "true"
    "The secret number is #{SECRET_NUMBER}"
  elsif guess.nil? || guess == 0
    ""
  elsif guess > SECRET_NUMBER
    too_high(guess)
  elsif guess < SECRET_NUMBER
    too_low(guess)
  elsif guess == SECRET_NUMBER
    "You got it right! The secret number is #{SECRET_NUMBER}"
  end
end

private

def too_low(guess)
  if guess < SECRET_NUMBER && guess >= SECRET_NUMBER - 5
    "Too Low!"
  elsif guess < SECRET_NUMBER
    "Way Too Low!"
  end
end

def too_high(guess)
  if guess > SECRET_NUMBER && guess <= SECRET_NUMBER + 5
    "Too High!"
  elsif guess > SECRET_NUMBER
    "Way Too Hi!"
  end
end

def color_checker(guess)
  if check_guess(guess) == "Way Too Hi!" || check_guess(guess) == "Way Too Low!"
    bg_color = "background: red;"
  elsif check_guess(guess) == "Too High!" || check_guess(guess) == "Too Low!"
    bg_color = "background: pink;"
  elsif check_guess(guess) == "You got it right! The secret number is #{SECRET_NUMBER}"
    bg_color = "background: green;"
  else
    bg_color = "background: orange;"
  end
end
