class JokeGenerator::Joke

  attr_accessor :title, :text

  def self.new_from_category_page (entry)
    self.new (
      #entry.css
      #entry.url
    )
  end

  def initialize (title = nil, text = nil)
    @title = nil
    @text = nil
  end

end
