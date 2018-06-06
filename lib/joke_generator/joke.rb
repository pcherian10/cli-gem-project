class JokeGenerator::Joke
  attr_accessor :title, :link

  @@all = []
  @category = []

    def self.new_from_joke_page (joke)
      self.new(
        joke.css("h3").text,
        joke.css("a").attribute("href").text
      )
    end

    def initialize (title = nil, link = nil)
      @title = title
      @link = link
      @@all << self
    end

    def self.all
      @@all
    end

    def self.reset_all
      @@all.clear
    end
end
