class JokeGenerator::Joke
  attr_accessor :title, :link

  @@all = []

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

    def self.find(id)
      self.all[id-1]
    end

    def self.all
      @@all
    end
end
