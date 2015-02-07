require 'sinatra'
require 'sinatra/reloader'

SECRET_NUM ||= rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)

  erb :index, :locals => {:message => message }
end

def check_guess(guess)
  case
    when guess > (SECRET_NUM + 5) then message = "way too high"
    when guess > SECRET_NUM then message = "too high"
    when guess < (SECRET_NUM - 5) then message = "way too low"
    when guess < SECRET_NUM then message = "too low"
    when guess == SECRET_NUM then message = "CORRECT! The secret number is #{SECRET_NUM}"
  end
end