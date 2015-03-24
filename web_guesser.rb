require 'sinatra'
require 'sinatra/fix_951'
require 'sinatra/reloader'


NUMBER = rand(100)

get '/' do
  guess   = params["guess"]
  message = check_guess(guess)

  erb :index, :locals => {:message => message}
end

def check_guess(guess)
  if guess.to_i > NUMBER + 5
    "Way too high!"
  elsif guess.to_i < NUMBER - 5
    "Way too low!"
  elsif guess.to_i > NUMBER
    "Too high!"
  elsif guess.to_i < NUMBER
    "Too low!"
  elsif guess.to_i == NUMBER
    "You got it right!"
  end
end
