# Our CLI Controller
require './lib/joke_generator.rb'
require 'pry'

class JokeGenerator::CLI

  def call
    JokeGenerator::Scraper.new.make_categories
    puts ""
    puts "Welcome to the Joke Generator!"
    puts "(sourced from comedycentral.com)"
    puts ""
    start
  end

  def start
      puts "Choose one of the options for a laugh!"
      puts ""
      puts "1. Tell me a joke! :)"
      puts "2. A joke of your choice from a category."
      puts ""
      first_input = gets.strip.to_i

      while(first_input != 1 && first_input != 2)
        puts "That's not funny, type in 1 or 2 for the options above!"
        first_input = gets.strip.to_i
      end

      if(first_input == 1)
        random_joke

      else
        print_joke_categories
        puts ""
        puts "Choose a category by entering a number:"
        input = gets.strip.to_i

        while (input > JokeGenerator::Category.all.length || input <= 0)
          puts "That's not funny! Enter one of the numbers!"
          input = gets.strip.to_i
        end

        category = JokeGenerator::Category.find(input)

        if category.jokes.length == 0
          JokeGenerator::Scraper.new.make_jokes(category.link)
          print_and_save_category_jokes (category)

        else
          print_category_jokes (category)
        end

        puts ""
        puts "Choose a joke by entering a number:"
        joke_input = gets.strip.to_i

        while (joke_input > category.jokes.length || joke_input <= 0)
          puts "That's not funny! Enter one of the numbers!"
          joke_input = gets.strip.to_i
        end

        joke = category.jokes[joke_input - 1]
        display_joke(joke,category)

      end

        puts ""
        puts "Would you like to laugh again? (y/n)"
        puts ""
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

  def random_joke
    input = rand(1..JokeGenerator::Category.all.length)
    category = JokeGenerator::Category.find(input)
      if category.jokes.length == 0
        JokeGenerator::Scraper.new.make_jokes(category.link)
        save_category_jokes (category)
      end
      joke_input = rand(1..category.jokes.length)
      joke = category.jokes[joke_input - 1]
      display_joke(joke,category)
  end

  def print_joke_categories
    JokeGenerator::Category.all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.title}"
    end
  end

  def print_and_save_category_jokes (category)
    JokeGenerator::Joke.all.each.with_index(1) do |joke, index|
      puts "#{index}. #{joke.title}"
    end
    save_category_jokes (category)
  end

  def print_category_jokes (category)
    category.jokes.each.with_index (1) do |joke, index|
        puts "#{index}. #{joke.title}"
    end
  end

  def save_category_jokes (category)
    JokeGenerator::Joke.all.each.with_index(1) do |joke, index|
      category.add_joke(joke)
    end
    JokeGenerator::Joke.reset_all
  end

  def display_joke (joke, category)
    joke_string = JokeGenerator::Scraper.new.scrape_joke(joke.link)
    joke_string = joke_string.split("© 2018 Comedy Partners. All Rights Reserved. Comedy Central and all related titles, logos and characters are trademarks of comedy partners.")
    puts ""
    puts "'#{joke.title}' filed under #{category.title} category."
    puts ""
    puts "#{joke_string[0]}"
    puts ""
  end

end
