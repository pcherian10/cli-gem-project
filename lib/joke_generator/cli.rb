# Our CLI Controller
require './lib/joke_generator.rb'

class JokeGenerator::CLI

  def call
    #JokeGenerator::Scraper.new.make_categories
    puts "Welcome to the Joke Generator!"
    start
  end

  def start
    puts ""
    puts "Choose from the below categories!"
    input = gets.strip.to_i
  end


end
