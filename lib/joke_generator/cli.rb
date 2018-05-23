# Our CLI Controller
require './lib/joke_generator.rb'
class JokeGenerator::CLI

  def call
    puts "Here's a joke!"
  end

end
