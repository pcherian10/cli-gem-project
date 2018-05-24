class JokeGenerator::Category

attr_accessor :title, :url

  def self.new_from_index_page (entry)
    self.new(
      entry.css(#html)
      entry.url
    )
  end

  def initialize (title = nil, url = nil)
    @title = title
    @url = url
  end

  def self.all

  end

end
