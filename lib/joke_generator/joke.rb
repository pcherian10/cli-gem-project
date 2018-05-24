class JokeGenerator::Joke

  attr_accessor :title, :text

  def self.new_from_category_page (entry)
    self.new(
      entry.css(#html)
      entry.url
    )

  def initialize (title = nil, text = nil)
    @title = nil
    @text = nil
  end

end
