class JokeGenerator::Scraper

  def get_page
    Nokogiri::HTML(open("http://jokes.cc.com/"))
  end

  def scrape_categories_index
    self.get_page.css(#some html)
  end

  def make_categories
    scrape_categories_index.each do |el|
      JokeGenerator::Category.new_from_index_page(el)
    end
  end

  def scrape_jokes_index
    self.get_page.css(#some html)
  end

  def make_jokes
    scrape_categories_index.each do |el|
      JokeGenerator::Joke.new_from_category_page(el)
    end
  end
end
