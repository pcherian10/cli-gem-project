# Our CLI Controller
require './lib/joke_generator.rb'

class JokeGenerator::CLI

  def call
    JokeGenerator::Scraper.new.make_categories
    puts ""
    puts "Welcome to the Joke Generator!"
    puts ""
    start
  end

  def start
      print_joke_categories
      puts ""
      puts "Choose a category by entering a number:"
      input = gets.strip.to_i

      while (input > JokeGenerator::Category.all.length || input <= 0)
        puts "That's not funny! Enter one of the numbers!"
        input = gets.strip.to_i
      end

      category = JokeGenerator::Category.find(input)
      JokeGenerator::Scraper.new.make_jokes(category.link)

      print_joke_list
      puts ""
      puts "Choose a joke by entering a number:"
      joke_input = gets.strip.to_i

      while (joke_input > JokeGenerator::Joke.all.length || joke_input <= 0)
        puts "That's not funny! Enter one of the numbers!"
        input = gets.strip.to_i
      end

      joke = JokeGenerator::Joke.find(joke_input)
      joke.reset_all
      JokeGenerator::Scraper.new.display_joke(joke.link)

      puts ""
      puts "Would you like to laugh again? (y/n)"
      end_input = gets.strip.downcase
        while (end_input != "y" && end_input != "n")
          puts "That's not funny, input y for yes, or n for no!"
          end_input = gets.strip.downcase
        end
        if (end_input == "y")
          start
        elsif(end_input == "n")
          puts "Thanks for playing! Hope you had a good laugh!"
        end
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
