class JokeGenerator::Scraper

 #category title - html.css("ul.list_horiz a").attribute("title").value
 #category link html.css("ul.list_horiz a").attribute("href").value

 def category_get_page
    html = File.read('fixtures/jokes.html')
    Nokogiri::HTML(html)
 end

 def scrape_categories_page
   self.category_get_page.css("ul.list_horiz a")
 end

 def make_categories
    scrape_categories_page.each do |category|
      JokeGenerator::Category.new_from_categories_page(category)
    end
 end

 def get_joke_list (joke_list)
     Nokogiri::HTML(open("#{joke_list}"))
 end

 def scrape_jokes_page(joke_list)
   self.get_joke_list(joke_list).css("div.tier_2_col ul li")
 end

 def make_jokes(joke_list)
   scrape_jokes_page(joke_list).each do |joke|
     JokeGenerator::Joke.new_from_joke_page(joke)
   end
 end

 def get_joke (joke_link)
   Nokogiri::HTML(open("#{joke_link}"))
 end

 def scrape_joke (joke_link)
   self.get_joke(joke_link).css("p").text
 end

end
