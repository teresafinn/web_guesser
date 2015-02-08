require 'sinatra'
require 'sinatra/reloader'

SECRET_NUM ||= rand(100)

class Guess
  attr_reader :guess, :message, :div_class

  def initialize(guess)
    @guess = guess
    @message = check_guess(guess)
    @div_class = css_class(guess)
  end

  def css_class(guess)
    case
    when guess > (SECRET_NUM + 5) then "way_high"
    when guess > SECRET_NUM then "high"
    when guess < (SECRET_NUM - 5) then "way_low"
    when guess < SECRET_NUM then "low"
    when guess == SECRET_NUM then "correct"
    end
  end

  def check_guess(guess)
    case
    when guess > (SECRET_NUM + 5) then "way too high"
    when guess > SECRET_NUM then "too high"
    when guess < (SECRET_NUM - 5) then "way too low"
    when guess < SECRET_NUM then "too low"
    when guess == SECRET_NUM then "CORRECT! The secret number is #{SECRET_NUM}"
    end
  end
end

get '/' do
  guess_number = params['guess'].to_i
  guess = Guess.new(guess_number)

  erb :index, :locals => {:guess => guess }
end