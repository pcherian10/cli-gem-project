# Our CLI Controller
require './lib/joke_generator.rb'

class JokeGenerator::CLI
  def call
    JokeGenerator::Scraper.new.make_categories
    puts ""
    puts "Welcome to the Joke Generator!"
    start
  end

  def start
      puts ""
      puts "Choose from the below categories:"
      puts ""
      print_joke_categories
      puts ""
      puts "Type 'exit' to leave."
      input = gets.strip.to_i
      category = JokeGenerator::Category.find(input)
      JokeGenerator::Scraper.new.make_jokes(category.link)
      puts ""
      puts "Choose from the below jokes:"
      puts ""
      puts "Type 'exit' to leave."
      print_joke_list
      joke_input = gets.strip.to_i
      joke = JokeGenerator::Joke.find(joke_input)
      JokeGenerator::Scraper.new.display_joke(joke.link)
  end

  def print_joke_categories
    JokeGenerator::Category.all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.title}"
    end
  end

  def print_joke_list
    JokeGenerator::Joke.all.each.with_index(1) do |joke, index|
      puts "#{index}. #{joke.title}"
    end
  end

end
