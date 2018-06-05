class JokeGenerator::Category

attr_accessor :title, :link

@@all = []

  def self.new_from_categories_page (category)
    self.new(
      category.attribute("title").value,
      category.attribute("href").value
    )
  end

  def initialize (title = nil, link = nil)
    @title = title
    @link = link
    @@all << self
  end

  def self.find(id)
   self.all[id - 1]
  end

  def self.all
    @@all
  end

end
