require 'sinatra'
require 'sinatra/reloader'

secret_num ||= rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)

  erb :index, :locals => {:secret_num => secret_num, :message => message }
end

check_guess(guess)
  if guess > (secret_num + 5)
      message = "way too high"
  elsif guess > secret_num
      message = "too high"
  elsif guess < (secret_num - 5)
      message = "way too low"
  elsif guess < secret_num
      message = "too low"
  elsif guess == secret_num
      message = "CORRECT! The secret number is #{secret_num}"
  end
end